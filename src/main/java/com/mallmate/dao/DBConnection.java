package com.mallmate.dao;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // Default local fallback (MySQL)
    private static final String DEFAULT_URL =
        "jdbc:mysql://localhost:3306/mallmate?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASSWORD = "root";

    public static Connection getConnection() throws Exception {
        String dbUrl = System.getenv("DB_URL");
        if (dbUrl == null || dbUrl.trim().isEmpty()) {
            dbUrl = System.getenv("DATABASE_URL");
        }

        String dbUser = System.getenv("DB_USER");
        String dbPassword = System.getenv("DB_PASSWORD");

        // Fallback to local default if no environment variables are set
        if (dbUrl == null || dbUrl.trim().isEmpty()) {
            dbUrl = DEFAULT_URL;
            if (dbUser == null) dbUser = DEFAULT_USER;
            if (dbPassword == null) dbPassword = DEFAULT_PASSWORD;
        }

        // Support standard PostgreSQL URI format (e.g., postgresql://postgres:pass@host:port/dbname)
        if (dbUrl.startsWith("postgres://") || dbUrl.startsWith("postgresql://")) {
            try {
                URI uri = new URI(dbUrl);
                String userInfo = uri.getUserInfo();
                if (userInfo != null) {
                    String[] parts = userInfo.split(":", 2);
                    if (dbUser == null && parts.length > 0) dbUser = parts[0];
                    if (dbPassword == null && parts.length > 1) dbPassword = parts[1];
                }
                String host = uri.getHost();
                int port = uri.getPort() == -1 ? 5432 : uri.getPort();
                String path = uri.getPath();
                if (path == null || path.isEmpty()) path = "/postgres";

                String query = uri.getQuery();
                StringBuilder jdbcUrl = new StringBuilder("jdbc:postgresql://")
                        .append(host).append(":").append(port).append(path);

                if (query != null && !query.isEmpty()) {
                    jdbcUrl.append("?").append(query);
                    if (!query.contains("sslmode")) {
                        jdbcUrl.append("&sslmode=require");
                    }
                } else {
                    jdbcUrl.append("?sslmode=require");
                }
                dbUrl = jdbcUrl.toString();
            } catch (Exception e) {
                // If URI parsing fails, convert prefix directly
                if (dbUrl.startsWith("postgres://")) {
                    dbUrl = "jdbc:postgresql://" + dbUrl.substring("postgres://".length());
                } else if (dbUrl.startsWith("postgresql://")) {
                    dbUrl = "jdbc:postgresql://" + dbUrl.substring("postgresql://".length());
                }
            }
        }

        // Ensure sslmode is required for Supabase cloud PostgreSQL connections
        if (dbUrl.contains("supabase.co") || dbUrl.contains("supabase.com") || dbUrl.contains("pooler.supabase.com")) {
            if (!dbUrl.contains("sslmode=")) {
                dbUrl += (dbUrl.contains("?") ? "&" : "?") + "sslmode=require";
            }
        }

        // Diagnostic logging (hiding actual password)
        String safeUrl = dbUrl.replaceAll("(?i)(password=)[^&;]*", "$1***")
                              .replaceAll("(?i)(://[^:]+:)[^@]+@", "$1***@");
        System.out.println("[DBConnection] Connecting to: " + safeUrl + (dbUser != null ? " (User: " + dbUser + ")" : ""));

        if (dbUrl.contains("db.") && dbUrl.contains(".supabase.co") && !dbUrl.contains("pooler.supabase.com")) {
            System.err.println("[DBConnection] WARNING: 'db.<ref>.supabase.co' is IPv6-only on Supabase. Render requires the IPv4 Session Pooler host (e.g., aws-0-[region].pooler.supabase.com:6543)!");
        }

        // Load the appropriate JDBC driver
        if (dbUrl.startsWith("jdbc:postgresql:") || dbUrl.contains("postgresql")) {
            Class.forName("org.postgresql.Driver");
        } else {
            Class.forName("com.mysql.cj.jdbc.Driver");
        }

        if (dbUser != null && dbPassword != null) {
            return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } else {
            return DriverManager.getConnection(dbUrl);
        }
    }
}