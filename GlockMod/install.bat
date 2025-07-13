@echo off
echo ========================================
echo    Glock Mod pro Drug Dealer Simulator 2
echo ========================================
echo.

echo Kontrolujem instalaci...

REM Zkontroluj, zda existuje Huslaa's ModKit
if not exist "..\Huslaa's DDS2 RePak.bat" (
    echo CHYBA: Huslaa's DDS2 ModKit nebyl nalezen!
    echo.
    echo Prosim stahnete si Huslaa's DDS2 ModKit z:
    echo https://www.nexusmods.com/drugdealersimulator2/mods/45
    echo.
    echo A umistete tento mod do stejne slozky jako ModKit.
    echo.
    pause
    exit /b 1
)

echo ModKit nalezen!
echo.

echo Spoustim instalaci modu...
echo.

REM Spusť ModKit s tímto modem
call "..\Huslaa's DDS2 RePak.bat" "%~dp0"

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo    Mod byl uspesne nainstalovany!
    echo ========================================
    echo.
    echo Glock 17 najdete v:
    echo - Cernem trhu
    echo - Zbrojiri
    echo.
    echo Uzijte si hru!
) else (
    echo.
    echo CHYBA: Instalace se nezdarila!
    echo Zkontrolujte konzoli vyse pro detaily.
)

echo.
pause
