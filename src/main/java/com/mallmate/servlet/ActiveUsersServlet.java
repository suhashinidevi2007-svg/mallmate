package com.mallmate.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.mallmate.dao.DBConnection;

@WebServlet("/activeUsers")
public class ActiveUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int totalUsers = 0;
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT COUNT(*) AS total FROM users")) {

            if (rs.next()) totalUsers = rs.getInt("total");

        } catch (Exception e) {
            e.printStackTrace();
        }

        Object visitObj = request.getAttribute("visitCount");
        int visitCount = visitObj != null ? (int) visitObj : 0;

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"totalUsers\":" + totalUsers + ",\"visitCount\":" + visitCount + "}");
        out.flush();
    }
}