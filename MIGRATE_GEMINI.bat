@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set REPO_URL=https://github.com/fleetmilegemini-cyber/geminibcd.git
set TARGET_DIR=geminibcd

echo =====================================================
echo  GEMINI MOBILITY - MASTER MIGRATION TOOL
echo =====================================================
echo.

REM 1. Check for Git
git --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed! Please install Git from https://git-scm.com/
    pause
    exit /b
)
echo [OK] Git found.

REM 2. Clone the repository
if exist "%TARGET_DIR%" (
    echo [INFO] Directory '%TARGET_DIR%' already exists. Updating...
    cd "%TARGET_DIR%"
    git pull
) else (
    echo [INFO] Cloning repository from GitHub...
    git clone %REPO_URL%
    cd "%TARGET_DIR%"
)

REM 3. Restore Environment (.env)
if not exist ".env" (
    echo.
    echo =====================================================
    echo  FIRST TIME SETUP: Security Credentials Needed
    echo =====================================================
    echo Your .env file was not in GitHub for security reasons.
    echo Please provide the keys below (or press Enter to skip and fill later):
    echo.
    
    set /p "ASKUI_ID=Enter AskUI Workspace ID: "
    set /p "ASKUI_TOKEN=Enter AskUI Token: "
    set /p "GEMINI_KEY=Enter Gemini API Key: "
    set /p "GITHUB_TOKEN=Enter GitHub Token (for sync): "

    (
    echo ASKUI_WORKSPACE_ID=!ASKUI_ID!
    echo ASKUI_TOKEN=!ASKUI_TOKEN!
    echo GEMINI_API_KEY=!GEMINI_KEY!
    echo GITHUB_TOKEN=!GITHUB_TOKEN!
    ) > .env
    echo [OK] .env file created.
)

REM 4. Integrate Gemini CLI Config
echo [INFO] Setting up Gemini CLI context...
if exist "gemini_config" (
    echo [OK] Found project configurations.
)

echo.
echo =====================================================
echo  SUCCESS: Migration Complete!
echo =====================================================
echo You are now ready to use Gemini CLI in this directory.
echo To sync changes back to cloud, use 'sync_github.bat'.
echo.
echo Press any key to start Gemini CLI here...
pause >nul
gemini ask "I have successfully migrated. What are our project goals?"
