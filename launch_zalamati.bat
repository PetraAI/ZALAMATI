@echo off
echo ==========================================
echo    ZALAMATI - Fast Learning Platform
echo ==========================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ and try again
    pause
    exit /b 1
)

:: Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js and try again
    pause
    exit /b 1
)

echo Setting up ZALAMATI environment...
echo.

:: Create virtual environment if it doesn't exist
if not exist "backend\venv" (
    echo Creating Python virtual environment...
    cd backend
    python -m venv venv
    cd ..
)

:: Activate virtual environment and install backend dependencies
echo Installing backend dependencies...
cd backend
call venv\Scripts\activate
pip install -r requirements.txt
cd ..

:: Install frontend dependencies
echo Installing frontend dependencies...
cd frontend
call npm install
cd ..

echo.
echo ==========================================
echo    Starting ZALAMATI Application
echo ==========================================
echo.

:: Start backend server in background
echo Starting backend server...
cd backend
call venv\Scripts\activate
start "ZALAMATI Backend" cmd /k "python app.py"
cd ..

:: Wait a moment for backend to start
timeout /t 3 /nobreak >nul

:: Start frontend development server
echo Starting frontend server...
cd frontend
start "ZALAMATI Frontend" cmd /k "npm start"
cd ..

echo.
echo ==========================================
echo ZALAMATI is starting up!
echo.
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Both servers are running in separate windows.
echo Close those windows to stop the application.
echo ==========================================
echo.

pause
