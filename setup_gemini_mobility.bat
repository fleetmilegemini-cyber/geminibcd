@echo off
REM ==============================================================================
REM  Gemini Mobility Setup Script
REM  Purpose: To create a portable context for Gemini CLI and project files.
REM  Instructions:
REM  1. Copy this 'geminibcd' folder to your new machine's Desktop.
REM  2. Ensure Node.js and Gemini CLI (@google/gemini-cli) are installed.
REM  3. Run this script by double-clicking it or via command line:
REM     cd C:\Users\user\Desktop\geminibcd
REM     setup_gemini_mobility.bat
REM  4. Follow the on-screen instructions to clone the GitHub repository and continue.
REM ==============================================================================

SETLOCAL ENABLEDELAYEDEXPANSION

REM --- Define Directories ---
SET TARGET_DIR=%USERPROFILE%\Desktop\geminibcd
SET CONFIG_DIR=%TARGET_DIR%\gemini_config
SET DOCS_DIR=%TARGET_DIR%\project_docs
SET GIT_INSTRUCTIONS_FILE=%TARGET_DIR%\NEXT_STEPS.txt

REM --- Create Directories ---
echo Creating directory structure...
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"
if not exist "%DOCS_DIR%" mkdir "%DOCS_DIR%"
echo Done.
echo.

REM --- Write Gemini Configuration Files ---
echo Saving Gemini configuration into '%CONFIG_DIR%'...

(
echo {
echo   "startupWarningCounts": {
echo     "home-directory": 1
echo   },
echo   "tipsShown": 10,
echo   "defaultBannerShownCount": {
echo     "3a1e05807b0856d4df68c0fc49c8afe0e2993dc0afac4118f162fe3f87de5083": 5
echo   }
echo }
) > "%CONFIG_DIR%\state.json"

(
echo {
echo   "projects": {
echo     "%%USERPROFILE%%": "user",
echo     "C:\Windows\System32": "system32"
echo   }
echo }
) > "%CONFIG_DIR%\projects.json"

(
echo {
echo   "security": {
echo     "auth": {
echo       "selectedType": "gemini-api-key"
echo     }
echo   }
echo }
) > "%CONFIG_DIR%\settings.json"

(
echo {
echo   "C:\Users\user": "TRUST_PARENT",
echo   "C:\Windows\System32": "TRUST_PARENT"
echo }
) > "%CONFIG_DIR%	rustedFolders.json"

echo Done saving config files.
echo.

REM --- Copy Project Documentation ---
echo Saving project documentation into '%DOCS_DIR%'...

(
echo # Gemini CLI Projekto Kontekstas
echo.
echo ## Svarbūs Kredencialai
echo - **AskUI Workspace ID:** 4b88641f-d48a-48dd-b6bc-8579846bc39b
echo - **AskUI Access Token:** eqWelr0VTBy3sQOEybzz
echo - **Gemini API Key:** AIzaSyCKD4PucCEDn5Hq06Bbh1XwUB6lSHzdWMI
echo.
echo ## Projekto Tikslai
echo - **Gemini Mobilumas:** Debesų migracija ir istorijos sinchronizavimas per GitHub.
echo - **Automatizavimas:** AskUI naudojimas testavimui ir operacinės sistemos valdymui.
echo - **Dokumentacija:** Visada pildyti `ISTORIJA.md` Desktop\askui kataloge.
echo.
echo ## Veiksmai po restarto
echo 1. Patikrinti 'Device Manager' dėl tvarkyklių klaidų (Intel/Realtek).
echo 2. Paleisti `ekrano_testas.py` patikrinimui.
echo 3. Sukurti `github.txt` su Tokenu ataskaitų kėlimui.
echo.
echo ## Instrukcija Agentui
Prieš pradedant bet kokią užduotį, perskaityti `Desktop\askui\ISTORIJA.md`, kad žinotum naujausią projekto būseną.
) > "%DOCS_DIR%\GEMINI.md"

(
echo # Projektas: askui-test
echo ## Istorija
echo.
echo ### 2026-04-19
echo - Pradėtas askui projekto paruošimas.
echo - Sukurta Python aplinka (venv) ir įdiegta `askui` biblioteka.
echo - Pridėti AskUI prisijungimo duomenys:
 echo   - Workspace ID: 4b88641f-d48a-48dd-b6bc-8579846bc39b
 echo   - Token: eqWelr0VTBy3sQOEybzz
echo - Planuojama išbandyti AskUI-Demo-Project.
echo.
) > "%DOCS_DIR%\ISTORIJA.md"

echo Done saving documentation.
echo.

REM --- GitHub Instructions ---
(
echo ==============================================================================
echo  Gemini Mobility - NEXT STEPS ON A NEW MACHINE
echo ==============================================================================
echo.
echo  You have successfully set up the core Gemini CLI context and project documentation.
echo  Now, let's get your GitHub integration working and continue development.
echo.
echo  ------------------------------------------------------------------------------
echo  SECTION 1: System Setup

echo  1. Ensure Node.js is installed on this machine.
echo  2. Install Gemini CLI globally: npm install -g @google/gemini-cli
echo  3. Install Git: If you don't have Git installed, download and install it from:
   https://git-scm.com/downloads
echo.
echo  ------------------------------------------------------------------------------
echo  SECTION 2: Project Setup & GitHub Integration

echo  1. Clone your 'Gemini Mobilumas' GitHub repository:
   Open a new command prompt and run:
   git clone [JŪSŲ_GITHUB_REPOZITORIJOS_URL]
   (Replace [JŪSŲ_GITHUB_REPOZITORIJOS_URL] with the actual URL, e.g., 
   https://github.com/your-username/gemini-mobility.git)
echo.
echo  2. Navigate into the cloned project directory:
   cd [PAVADINIMAS_JŪSŲ_REPOZITORIJOS_APSAUGOS]
   (e.g., cd gemini-mobility)
echo.
echo  3. Configure your Git identity (if not already set up globally):
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
echo.
echo  4. GitHub Authentication:
   - For HTTPS cloning/pushing:
     You will be prompted for your GitHub username and password/token.
     It's recommended to use a Personal Access Token (PAT) instead of your password.
     Generate one here: https://github.com/settings/tokens
   - For SSH cloning/pushing:
     Ensure you have an SSH key set up and added to your GitHub account.
     (See: https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
echo.
echo  5. GitHub Token for Reports (as mentioned in GEMINI.md):
   If you need to upload reports to GitHub, create a file named 'github.txt'
   in the root of your *cloned project directory* and paste your GitHub PAT into it.
   Example: echo YOUR_GITHUB_PAT_HERE ^> github.txt
   (This is for reporting purposes and should ideally be managed securely,
   not directly in the project if it's a public repo).
echo.
echo  ------------------------------------------------------------------------------
echo  SECTION 3: Running Gemini CLI and Continuing Work

echo  1. Open a new command prompt.
 echo  2. Navigate to the root of your *cloned project directory*.
 echo  3. You can now use Gemini CLI commands. It will automatically find context
    from the 'geminibcd' folder and the project's .md files.
 echo.
 echo  Example commands:
 echo  gemini ask "What are the project goals?"
 echo  gemini read GEMINI.md
 echo  gemini read ISTORIJA.md
 echo.
 echo  To continue development on Gemini Mobility:
 echo  gemini enter_plan_mode --reason "Continue Gemini Mobility project development"
 echo.
 echo ==============================================================================
echo  Setup Script Finished. Press any key to exit.
echo ==============================================================================
) > "%GIT_INSTRUCTIONS_FILE%"

echo.
echo =====================================================
echo  Gemini Mobility Setup Script Created!

echo =====================================================
echo.
echo  The following files have been created:
echo    - %CONFIG_DIR%\state.json
echo    - %CONFIG_DIR%\projects.json
echo    - %CONFIG_DIR%\settings.json
echo    - %CONFIG_DIR%	rustedFolders.json
echo    - %DOCS_DIR%\GEMINI.md
echo    - %DOCS_DIR%\ISTORIJA.md
echo    - %GIT_INSTRUCTIONS_FILE%
echo.
echo  Please ensure you have Node.js and Gemini CLI installed on the new machine.
echo  Then, copy the entire '%TARGET_DIR%' folder to the new machine's Desktop.
echo  Double-click '%GIT_INSTRUCTIONS_FILE%' to see the next steps.
echo.
echo  Press any key to close this setup script.
pause >nul

ENDLOCAL