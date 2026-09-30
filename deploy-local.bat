@echo off
echo ========================================================
echo 1. Building MallMate Web Application (Maven Package)...
echo ========================================================
call .\mvnw.cmd package -DskipTests
if %errorlevel% neq 0 (
    echo [ERROR] Build failed! Check the error above.
    pause
    exit /b %errorlevel%
)

echo.
echo ========================================================
echo 2. Deploying mallmate.war to local Apache Tomcat...
echo ========================================================
copy /Y "target\mallmate.war" "C:\Users\suhas\apache-tomcat-9.0.83\webapps\mallmate.war"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to copy WAR file to Tomcat webapps!
    pause
    exit /b %errorlevel%
)

echo.
echo ========================================================
echo 3. Starting Apache Tomcat 9...
echo ========================================================
start "Tomcat Server" "C:\Users\suhas\apache-tomcat-9.0.83\bin\startup.bat"

echo.
echo ========================================================
echo SUCCESS! Tomcat is starting up.
echo Open your browser at: http://localhost:8080/mallmate/
echo ========================================================
