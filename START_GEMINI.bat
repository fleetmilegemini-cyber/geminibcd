@echo off
echo =====================================================
echo  GEMINI MOBILITY - STARTING CONTEXT
echo =====================================================

REM 1. Pull latest "memory" from GitHub
echo Synchronizing memory from cloud...
git pull origin master
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] Could not pull updates. Working with local memory.
)

REM 2. Set environment variables for the session
set "ASKUI_WORKSPACE_ID=4b88641f-d48a-48dd-b6bc-8579846bc39b"
set "ASKUI_TOKEN=eqWelr0VTBy3sQOEybzz"

echo [INFO] Current model configuration:
gemini config get defaultModel

echo.
echo [SUCCESS] Your micro-universe is ready.
echo [INFO] Read project_docs\ISTORIJA.md to refresh history.
echo =====================================================
cmd /k
