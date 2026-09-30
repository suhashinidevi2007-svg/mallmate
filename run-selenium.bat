@echo off
echo ========================================================
echo Running MallMate Selenium Automation Tests...
echo ========================================================
echo.
echo Browser: Google Chrome (Automated via Selenium 4.11)
echo Target: https://mallmate.onrender.com/
echo.

call .\mvnw.cmd test -Dtest=MallMateSeleniumTest %*

echo.
echo ========================================================
echo Automation Complete!
echo Screenshots have been saved to the 'screenshots\' folder.
echo ========================================================
pause
