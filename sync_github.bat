@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo =====================================================
echo  Gemini Mobility - GitHub Sync
echo =====================================================

REM 1. Get updates from GitHub
echo Checking for updates from GitHub...
git pull origin master
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to pull updates. Check your internet connection or GitHub access.
    pause
    exit /b %ERRORLEVEL%
)
echo Done.
echo.

REM 2. Stage all changes
echo Staging changes...
git add .
echo Done.
echo.

REM 3. Ask for commit message or use default
set "commit_msg="
set /p "commit_msg=Enter commit message (or press Enter for default 'Auto-sync: %date% %time%'): "

if "!commit_msg!"=="" (
    set "commit_msg=Auto-sync: %date% %time%"
)

REM 4. Commit changes
echo Committing changes with message: "!commit_msg!"...
git commit -m "!commit_msg!"
if %ERRORLEVEL% NEQ 0 (
    echo [INFO] No changes to commit.
) else (
    echo Done.
)
echo.

REM 5. Push to GitHub
echo Pushing changes to GitHub...
git push origin master
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Failed to push changes.
    pause
    exit /b %ERRORLEVEL%
)
echo.
echo =====================================================
echo  SUCCESS: GitHub Synchronization Complete!
echo =====================================================
echo.
pause
