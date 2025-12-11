@echo off
cls
echo ========================================
echo   Agentic AI - Complete Setup and Run
echo ========================================
echo.

cd /d "%~dp0"

REM Check if venv exists
if not exist venv (
    echo [1/3] Creating virtual environment...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo ERROR: Failed to create venv. Trying 'py' command...
        py -m venv venv
        if %errorlevel% neq 0 (
            echo FATAL: Cannot create virtual environment.
            pause
            exit /b 1
        )
    )
    echo Virtual environment created!
) else (
    echo [1/3] Virtual environment exists.
)

echo.
echo [2/3] Installing/Updating dependencies...
call venv\Scripts\activate
pip install --upgrade pip
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo ERROR: Failed to install dependencies.
    pause
    exit /b 1
)

echo.
echo [3/3] Starting FastAPI server...
echo.
echo ========================================
echo Server will run on: http://localhost:8000
echo Open your browser to: http://localhost:8000/static/index.html
echo ========================================
echo.
echo Press Ctrl+C to stop the server.
echo.

python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Server failed to start. Check error messages above.
    pause
)
