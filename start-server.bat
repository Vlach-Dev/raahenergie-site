@echo off
echo.
echo  ==============================
echo   RAAH ENERGIE - Local Server
echo  ==============================
echo.

:: Try Python 3
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Starting server at http://localhost:8000
    echo  Press Ctrl+C to stop.
    echo.
    start "" http://localhost:8000
    python -m http.server 8000
    goto :end
)

:: Try Python as py launcher
py --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Starting server at http://localhost:8000
    echo  Press Ctrl+C to stop.
    echo.
    start "" http://localhost:8000
    py -m http.server 8000
    goto :end
)

:: Try Node.js npx serve
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo  Starting server at http://localhost:3000
    echo  Press Ctrl+C to stop.
    echo.
    start "" http://localhost:3000
    npx --yes serve .
    goto :end
)

echo  ERROR: Python or Node.js not found.
echo  Please install one of:
echo    - Python: https://www.python.org/downloads/
echo    - Node.js: https://nodejs.org/
echo.
pause

:end
