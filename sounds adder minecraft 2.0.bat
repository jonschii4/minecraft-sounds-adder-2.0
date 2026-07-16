::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDZRRQrCbiuqBYk45//14+WGpl4hZ+EtfYrVybyBNK1BuheyOMZ6mysP1ZpcXkoMK1yibQBU
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsGAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQI9IRVRTxaDOn/6FboJ5uzor+uDpkgPFLBxKO8=
::eg0/rx1wNQPfEVWB+kM9LVsJDAmLMm65FLQa/Kjo4P+Jpl5dVeY7fZ2biPreQA==
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIxLB8UTwuPLGe/ErAQ8aj16v3HsUIIWuYsOJjSzrzONOga+QXUZ5kqxHtX2P8DTBZRcBeofA4yvS8i
::dhA7uBVwLU+EWFOL+lEzIBJdGEqLMmja
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE2WsEaBddTwGMP27a
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDZRRQrCbiuqBYk47fvw++WXnmAUWucte47dzvS9L/Ud7lakVJIp02gayoVcQh5Ae3I=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
title Minecraft Sounds Adder 2.0
cls

:: Define ANSI Escape Codes for Colors
set "ESC="
set "RESET=%ESC%[0m"
set "BOLD=%ESC%[1m"
set "WHITE=%ESC%[97m"
set "BLUE=%ESC%[94m"
set "GREEN=%ESC%[92m"
set "YELLOW=%ESC%[93m"
set "RED=%ESC%[91m"
set "CYAN=%ESC%[96m"

:: ------------------------------------------
:: DYNAMIC RANDOM LOADING BAR STARTUP
:: ------------------------------------------
set "PROGRESS=0"

:loading_loop
cls
echo.
echo  %BOLD%%CYAN%Loading Minecraft Sound Generator 2.0...%RESET%
echo.

:: Calculate how many green blocks to show (out of 40 total characters wide)
set /a "BLOCKS=(PROGRESS * 40) / 100"
set /a "SPACES=40 - BLOCKS"

:: Build the visual bar
set "BAR="
for /l %%i in (1,1,%BLOCKS%) do set "BAR=!BAR!/"
set "EMPTY="
for /l %%i in (1,1,%SPACES%) do set "EMPTY=!EMPTY! "

:: Display progress
if %PROGRESS% LSS 100 (
    printf "%BLUE%[!BAR!%RESET%%WHITE%!EMPTY!%BLUE%] %YELLOW%!PROGRESS!%%%RESET%" 2>nul || <nul set /p ="%BLUE%[!BAR!%RESET%%WHITE%!EMPTY!%BLUE%] %YELLOW%!PROGRESS!%%%RESET%"
    
    :: Generate a random increment between 1 and 10
    set /a "INC=(!RANDOM! %% 10) + 1"
    set /a "PROGRESS+=INC"
    
    :: Cap progress at 100
    if !PROGRESS! GTR 100 set "PROGRESS=100"
    
    :: Wait a brief moment (approx 100-200ms using a quick ping delay)
    ping -n 1 -w 150 127.0.0.1 >nul
    goto loading_loop
)

:: Show final 100% frame
printf "%BLUE%[!BAR!%BLUE%] %GREEN%100%%%RESET%" 2>nul || <nul set /p ="%BLUE%[!BAR!%BLUE%] %GREEN%100%%%RESET%"
ping -n 1 -w 500 127.0.0.1 >nul
cls

echo %BLUE%===================================================%RESET%
echo %BOLD%%CYAN%        MINECRAFT SOUNDS ADDER 2.0        %RESET%
echo %BLUE%===================================================%RESET%
echo.

:: 1. In-game Name
printf "%YELLOW%Enter your In-Game Name (IGN): %RESET%" 2>nul || <nul set /p ="%YELLOW%Enter your In-Game Name (IGN): %RESET%"
set /p IGN=""
echo.

:: 2. Stream option
:stream_loop
printf "%YELLOW%Stream? (y/n): %RESET%" 2>nul || <nul set /p ="%YELLOW%Stream? (y/n): %RESET%"
set /p STREAM_YN=""
if /i "%STREAM_YN%"=="y" (
    set "STREAM_VAL=true"
) else if /i "%STREAM_YN%"=="n" (
    set "STREAM_VAL=false"
) else (
    echo %RED%[!] Invalid input. Please enter 'y' or 'n'.%RESET%
    goto stream_loop
)
echo.

:: 3. Category Choice
echo %CYAN%Please choose a category from the list below:%RESET%
echo %BLUE%---------------------------------------------------%RESET%
echo  - master
echo  - music
echo  - record
echo  - weather
echo  - blocks
echo  - hostile
echo  - neutral
echo  - players
echo  - ambient
echo  - voice
echo  - %GREEN%ui%RESET% %YELLOW%(1.21.6+ only!)%RESET%
echo %BLUE%---------------------------------------------------%RESET%
printf "%YELLOW%Enter Category: %RESET%" 2>nul || <nul set /p ="%YELLOW%Enter Category: %RESET%"
set /p CATEGORY=""
echo.

:: 4. Namespace (Default: minecraft)
set "NAMESPACE=minecraft"
printf "%YELLOW%Enter Namespace [Default: minecraft]: %RESET%" 2>nul || <nul set /p ="%YELLOW%Enter Namespace [Default: minecraft]: %RESET%"
set /p NAMESPACE=""
echo.

:: 5. Sound ID & Sound Files
printf "%YELLOW%Enter Sound ID (This will be the key in sounds.json): %RESET%" 2>nul || <nul set /p ="%YELLOW%Enter Sound ID (This will be the key in sounds.json): %RESET%"
set /p SOUND_ID=""
echo.

echo %YELLOW%[!] Reminder: Your actual sound files must be in .ogg format!%RESET%
printf "%YELLOW%Enter sound name (use , to add multiple in 1 list): %RESET%" 2>nul || <nul set /p ="%YELLOW%Enter sound name (use , to add multiple in 1 list): %RESET%"
set /p SOUND_NAME=""
echo.

:: Define file paths
set "JSON_DIR=assets\%NAMESPACE%"
set "JSON_FILE=%JSON_DIR%\sounds.json"

:: Check if the exact key/ID exists in the JSON file
set "EXISTS=0"
if exist "%JSON_FILE%" (
    :: Find the exact sound ID key wrapped in quotes
    findstr /R /C:"\"%SOUND_ID%\"[[:space:]]*:" "%JSON_FILE%" >nul 2>&1
    if not errorlevel 1 (
        set "EXISTS=1"
    )
)

:: Handle duplicate entry warning
if "%EXISTS%"=="1" (
    echo %RED%[WARNING] Duplicate detected!%RESET%
    echo.
    :override_loop
    printf "%RED%Override? (y/n): %RESET%" 2>nul || <nul set /p ="%RED%Override? (y/n): %RESET%"
    set /p OVERRIDE=""
    if /i "%OVERRIDE%"=="n" (
        echo.
        echo %RED%[!] Aborted. No changes were made to your files.%RESET%
        pause
        exit /b
    )
    if /i not "%OVERRIDE%"=="y" (
        echo %RED%Invalid choice. Please enter 'y' or 'n'.%RESET%
        goto override_loop
    )
)

:: Create folder structure safely
echo %WHITE%Creating folder structure: %JSON_DIR%\sounds...%RESET%
mkdir "%JSON_DIR%\sounds" 2>nul

:: --- BACKUP BEFORE MODIFICATIONS ---
if exist "%JSON_FILE%" (
    echo %WHITE%Saving original state to %YELLOW%sounds.before_modifications%WHITE%...%RESET%
    copy "%JSON_FILE%" "sounds.before_modifications" >nul
) else (
    :: Clean up old files from prior projects if starting entirely fresh
    if exist "sounds.before_modifications" del "sounds.before_modifications" >nul
)

:: Safely process multiple sound files and append/update the JSON via PowerShell
powershell -NoProfile -Command ^
    "$p = '%JSON_FILE%';" ^
    "$j = if ((Test-Path $p) -and ((Get-Item $p).Length -gt 0)) { Get-Content $p -Raw | ConvertFrom-Json } else { New-Object PSCustomObject };" ^
    "$rawSounds = '%SOUND_NAME%';" ^
    "$soundList = @();" ^
    "foreach ($s in $rawSounds.Split(',')) {" ^
    "    $clean = $s.Trim();" ^
    "    if ($clean -ne '') {" ^
    "        $soundList += [PSCustomObject]@{ name = '%NAMESPACE%:' + $clean; stream = [System.Convert]::ToBoolean('%STREAM_VAL%') };" ^
    "    }" ^
    "};" ^
    "$sObject = [PSCustomObject]@{ category = '%CATEGORY%'; sounds = $soundList };" ^
    "$j | Add-Member -MemberType NoteProperty -Name '%SOUND_ID%' -Value $sObject -Force;" ^
    "$j | ConvertTo-Json -Depth 10 | Set-Content $p"

:: --- BACKUP AFTER MODIFICATIONS ---
echo %WHITE%Saving post-modification state to %YELLOW%sounds.backup%WHITE%...%RESET%
copy "%JSON_FILE%" "sounds.backup" >nul

echo.
echo %GREEN%===================================================%RESET%
echo %BOLD%%GREEN%  SUCCESS! Setup completed by %IGN%                  %RESET%
echo %GREEN%===================================================%RESET%
echo  %GREEN%[+]%RESET% Folder Checked/Created:  %WHITE%%JSON_DIR%\sounds\%RESET%
echo  %GREEN%[+]%RESET% Config Added/Updated:    %WHITE%%JSON_FILE%%RESET%
if exist "sounds.before_modifications" (
echo  %GREEN%[+]%RESET% Pre-Mod Backup:          %YELLOW%sounds.before_modifications%RESET%
)
echo  %GREEN%[+]%RESET% Post-Mod Backup:         %YELLOW%sounds.backup%RESET%
echo %GREEN%===================================================%RESET%
echo %YELLOW%----------------------------------------%RESET%
echo %BOLD%%WHITE%Please make sure you reloaded minecraft to apply recend changes%RESET%
echo %YELLOW%-----------------------------------------%RESET%
echo.
pause