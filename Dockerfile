# =====================================================================
# Dockerfile for MallMate Web Application (Deployable on Render)
# Multi-stage build: Maven build -> Apache Tomcat 9 Runtime
# =====================================================================

# Stage 1: Build the WAR artifact
FROM maven:3.9-eclipse-temurin-17 AS builder
WORKDIR /build

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Build the WAR file (skip test during container build)
RUN mvn clean package -DskipTests

# Stage 2: Deploy in Apache Tomcat 9
FROM tomcat:9.0-jdk17-temurin
WORKDIR /usr/local/tomcat

# Remove default Tomcat web applications
RUN rm -rf webapps/*

# Copy WAR file as ROOT.war so application serves from root path (/)
COPY --from=builder /build/target/mallmate.war webapps/ROOT.war

# Render exposes the application through dynamic $PORT
EXPOSE 8080

# Dynamically bind Tomcat port to Render's $PORT (fallback to 8080) and run
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT:-8080}\\\"/g\" conf/server.xml && catalina.sh run"]
