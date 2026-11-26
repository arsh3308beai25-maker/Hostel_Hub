@echo off
cls
echo [HostelHub] Compiling Java files...
if not exist bin mkdir bin
javac -d bin -sourcepath src src\com\hostelhub\Main.java
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Compilation failed. Please check your code.
    pause
    exit /b %errorlevel%
)
echo [HostelHub] Running Application...
echo.
java -cp bin com.hostelhub.Main
echo.
pause
