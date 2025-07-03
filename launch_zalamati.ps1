# ZALAMATI - Fast Learning Platform Launcher
# PowerShell Script for One-Click Setup and Launch

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    ZALAMATI - Fast Learning Platform    " -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Python is installed
try {
    $pythonVersion = python --version 2>$null
    Write-Host "✓ Python found: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Python is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Python 3.8+ and try again" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if Node.js is installed
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✓ Node.js found: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ ERROR: Node.js is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Node.js and try again" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Setting up ZALAMATI environment..." -ForegroundColor Yellow

# Create virtual environment if it doesn't exist
if (-not (Test-Path "backend\venv")) {
    Write-Host "Creating Python virtual environment..." -ForegroundColor Blue
    Set-Location backend
    python -m venv venv
    Set-Location ..
    Write-Host "✓ Virtual environment created" -ForegroundColor Green
} else {
    Write-Host "✓ Virtual environment already exists" -ForegroundColor Green
}

# Install backend dependencies
Write-Host "Installing backend dependencies..." -ForegroundColor Blue
Set-Location backend
& "venv\Scripts\Activate.ps1"
pip install -r requirements.txt
Set-Location ..
Write-Host "✓ Backend dependencies installed" -ForegroundColor Green

# Install frontend dependencies
Write-Host "Installing frontend dependencies..." -ForegroundColor Blue
Set-Location frontend
npm install
Set-Location ..
Write-Host "✓ Frontend dependencies installed" -ForegroundColor Green

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "    Starting ZALAMATI Application       " -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Start backend server
Write-Host "Starting backend server..." -ForegroundColor Blue
Set-Location backend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "& 'venv\Scripts\Activate.ps1'; python app.py" -WindowStyle Normal
Set-Location ..

# Wait for backend to start
Start-Sleep -Seconds 3

# Start frontend server
Write-Host "Starting frontend server..." -ForegroundColor Blue
Set-Location frontend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
Set-Location ..

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "ZALAMATI is starting up!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Cyan
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "Both servers are running in separate windows." -ForegroundColor White
Write-Host "Close those windows to stop the application." -ForegroundColor White
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

# Optional: Open browser automatically
$openBrowser = Read-Host "Open ZALAMATI in browser automatically? (y/n)"
if ($openBrowser -eq "y" -or $openBrowser -eq "Y") {
    Start-Sleep -Seconds 5
    Start-Process "http://localhost:3000"
}

Read-Host "Press Enter to exit this launcher"
