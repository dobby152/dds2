@echo off
setlocal enabledelayedexpansion
title Drug Dealer Simulator 2 - Professional Glock Mod Uninstaller

:: Barvy pro konzoli
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "RED=%ESC%[91m"
set "GREEN=%ESC%[92m"
set "YELLOW=%ESC%[93m"
set "BLUE=%ESC%[94m"
set "MAGENTA=%ESC%[95m"
set "CYAN=%ESC%[96m"
set "WHITE=%ESC%[97m"
set "RESET=%ESC%[0m"

echo %RED%========================================%RESET%
echo %RED%   DDS2 Professional Glock Mod%RESET%
echo %RED%         UNINSTALLER v1.0%RESET%
echo %RED%========================================%RESET%
echo.
echo %WHITE%Tento nástroj odstraní Professional Glock Mod%RESET%
echo %WHITE%z Drug Dealer Simulator 2%RESET%
echo.

:: Varování
echo %YELLOW%⚠ VAROVÁNÍ ⚠%RESET%
echo %YELLOW%Tato akce je nevratná!%RESET%
echo %YELLOW%Ujistěte se, že máte zálohu save souborů.%RESET%
echo.

set /p "CONFIRM=Opravdu chcete odinstalovat mod? (ano/ne): "
if /i not "!CONFIRM!"=="ano" (
    echo %CYAN%Odinstalace zrušena uživatelem.%RESET%
    pause
    exit /b 0
)

echo.
echo %BLUE%Zahajuji odinstalaci...%RESET%
echo.

:: Kontrola běžící hry
echo %BLUE%[1/6]%RESET% Kontroluji běžící procesy...
tasklist /FI "IMAGENAME eq DrugDealerSimulator2.exe" 2>NUL | find /I /N "DrugDealerSimulator2.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo %YELLOW%⚠ Hra je spuštěná!%RESET%
    echo %YELLOW%Prosím ukončete hru před pokračováním.%RESET%
    echo.
    set /p "KILL_GAME=Chcete hru ukončit automaticky? (ano/ne): "
    if /i "!KILL_GAME!"=="ano" (
        taskkill /F /IM "DrugDealerSimulator2.exe" >nul 2>&1
        echo %GREEN%✓ Hra byla ukončena%RESET%
        timeout /t 3 >nul
    ) else (
        echo %RED%Odinstalace přerušena. Ukončete hru a spusťte znovu.%RESET%
        pause
        exit /b 1
    )
) else (
    echo %GREEN%✓ Hra není spuštěná%RESET%
)

:: Hledání instalace hry
echo %BLUE%[2/6]%RESET% Hledám instalaci hry...
set "GAME_PATH="
set "STEAM_PATH="

:: Hledání Steam
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Valve\Steam" /v "InstallPath" 2^>nul') do set "STEAM_PATH=%%b"
if "!STEAM_PATH!"=="" (
    for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Valve\Steam" /v "InstallPath" 2^>nul') do set "STEAM_PATH=%%b"
)

if exist "!STEAM_PATH!\steamapps\common\Drug Dealer Simulator 2" (
    set "GAME_PATH=!STEAM_PATH!\steamapps\common\Drug Dealer Simulator 2"
    echo %GREEN%✓ Hra nalezena: !GAME_PATH!%RESET%
) else (
    echo %YELLOW%⚠ Automatické nalezení hry selhalo%RESET%
    set /p "GAME_PATH=Zadejte cestu k hře: "
    if not exist "!GAME_PATH!\DrugDealerSimulator2.exe" (
        echo %RED%✗ Neplatná cesta k hře!%RESET%
        pause
        exit /b 1
    )
)

:: Vytvoření zálohy před odstraněním
echo %BLUE%[3/6]%RESET% Vytvářím zálohu před odstraněním...
if not exist "UninstallBackup" mkdir "UninstallBackup"
set "BACKUP_NAME=UninstallBackup\PreUninstall_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
set "BACKUP_NAME=!BACKUP_NAME: =0!"
mkdir "!BACKUP_NAME!" 2>nul

:: Záloha save souborů
if exist "!GAME_PATH!\Saved" (
    xcopy "!GAME_PATH!\Saved" "!BACKUP_NAME!\Saved\" /E /I /Q >nul 2>&1
    echo %GREEN%✓ Save soubory zazálohovány%RESET%
)

:: Hledání mod souborů
echo %BLUE%[4/6]%RESET% Hledám soubory modu...
set "MOD_FILES_FOUND=0"
set "FILES_TO_REMOVE="

:: Seznam souborů k odstranění
set "MOD_FILES[0]=DrugDealerSimulator2\Content\DataTables\DT_ItemsDatabase_Glock.uasset"
set "MOD_FILES[1]=DrugDealerSimulator2\Content\DataTables\DT_AmmunitionDatabase_9mm.uasset"
set "MOD_FILES[2]=DrugDealerSimulator2\Content\DataTables\DT_ShopInventoryDatabase_Weapons.uasset"
set "MOD_FILES[3]=DrugDealerSimulator2\Content\DataTables\DT_QuestDatabase_Weapons.uasset"
set "MOD_FILES[4]=DrugDealerSimulator2\Content\DataTables\DT_BalanceDatabase_Weapons.uasset"
set "MOD_FILES[5]=DrugDealerSimulator2\Content\Blueprints\Weapons\BP_Glock17.uasset"
set "MOD_FILES[6]=DrugDealerSimulator2\Content\Meshes\Weapons\SM_Glock17.uasset"
set "MOD_FILES[7]=DrugDealerSimulator2\Content\Materials\Weapons\M_Glock17_Body.uasset"
set "MOD_FILES[8]=DrugDealerSimulator2\Content\Materials\Weapons\M_Glock17_Slide.uasset"
set "MOD_FILES[9]=DrugDealerSimulator2\Content\Materials\Weapons\M_Glock17_Barrel.uasset"
set "MOD_FILES[10]=DrugDealerSimulator2\Content\Audio\Weapons\SC_Glock17_Fire.uasset"
set "MOD_FILES[11]=DrugDealerSimulator2\Content\Audio\Weapons\SC_Glock17_Reload.uasset"
set "MOD_FILES[12]=DrugDealerSimulator2\Content\VFX\Weapons\P_Pistol_MuzzleFlash.uasset"
set "MOD_FILES[13]=DrugDealerSimulator2\Content\VFX\Weapons\P_9mm_ShellEject.uasset"
set "MOD_FILES[14]=DrugDealerSimulator2\Content\UI\Icons\Weapons\T_Glock17_Icon.uasset"
set "MOD_FILES[15]=DrugDealerSimulator2\Content\UI\Icons\Ammo\T_9mm_Icon.uasset"

:: Kontrola existence souborů
for /L %%i in (0,1,15) do (
    if exist "!GAME_PATH!\!MOD_FILES[%%i]!" (
        set /a MOD_FILES_FOUND+=1
        echo %YELLOW%Nalezen: !MOD_FILES[%%i]!%RESET%
    )
)

if !MOD_FILES_FOUND! equ 0 (
    echo %YELLOW%⚠ Žádné soubory modu nebyly nalezeny%RESET%
    echo %YELLOW%Mod pravděpodobně není nainstalován nebo byl již odstraněn%RESET%
    echo.
    set /p "CONTINUE=Pokračovat v čištění? (ano/ne): "
    if /i not "!CONTINUE!"=="ano" (
        echo %CYAN%Odinstalace zrušena.%RESET%
        pause
        exit /b 0
    )
) else (
    echo %GREEN%✓ Nalezeno !MOD_FILES_FOUND! souborů modu%RESET%
)

:: Odstranění souborů
echo %BLUE%[5/6]%RESET% Odstraňuji soubory modu...
set "REMOVED_COUNT=0"

for /L %%i in (0,1,15) do (
    if exist "!GAME_PATH!\!MOD_FILES[%%i]!" (
        del "!GAME_PATH!\!MOD_FILES[%%i]!" >nul 2>&1
        if not exist "!GAME_PATH!\!MOD_FILES[%%i]!" (
            set /a REMOVED_COUNT+=1
            echo %GREEN%✓ Odstraněn: !MOD_FILES[%%i]!%RESET%
        ) else (
            echo %RED%✗ Chyba při odstraňování: !MOD_FILES[%%i]!%RESET%
        )
    )
)

:: Odstranění prázdných složek
echo %YELLOW%Odstraňuji prázdné složky...%RESET%
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\Blueprints\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\Meshes\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\Materials\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\Audio\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\VFX\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\UI\Icons\Weapons" 2>nul
rmdir "!GAME_PATH!\DrugDealerSimulator2\Content\UI\Icons\Ammo" 2>nul

:: Čištění registru a cache
echo %BLUE%[6/6]%RESET% Čistím cache a dočasné soubory...

:: Odstranění shader cache
if exist "!GAME_PATH!\Saved\ShaderDebugInfo" (
    rmdir /S /Q "!GAME_PATH!\Saved\ShaderDebugInfo" >nul 2>&1
    echo %GREEN%✓ Shader cache vyčištěn%RESET%
)

:: Odstranění mod cache
if exist "!GAME_PATH!\Saved\ModCache" (
    rmdir /S /Q "!GAME_PATH!\Saved\ModCache" >nul 2>&1
    echo %GREEN%✓ Mod cache vyčištěn%RESET%
)

:: Výsledek
echo.
if !REMOVED_COUNT! gtr 0 (
    echo %GREEN%========================================%RESET%
    echo %GREEN%    MOD BYL ÚSPĚŠNĚ ODSTRANĚN!%RESET%
    echo %GREEN%========================================%RESET%
    echo.
    echo %WHITE%Odstraněno !REMOVED_COUNT! souborů%RESET%
    echo %WHITE%Záloha uložena v: !BACKUP_NAME!%RESET%
    echo.
    echo %CYAN%Co bylo odstraněno:%RESET%
    echo %YELLOW%• Glock 17 pistole%RESET%
    echo %YELLOW%• 9mm Parabellum munice%RESET%
    echo %YELLOW%• Questy související se zbraněmi%RESET%
    echo %YELLOW%• Modifikace obchodů%RESET%
    echo %YELLOW%• Vyvážení ekonomiky%RESET%
    echo %YELLOW%• Všechny assety a textury%RESET%
    echo.
    echo %GREEN%Hra je nyní ve výchozím stavu.%RESET%
    echo %WHITE%Doporučujeme ověřit integritu souborů ve Steam.%RESET%
) else (
    echo %YELLOW%========================================%RESET%
    echo %YELLOW%    ČÁSTEČNÁ ODINSTALACE%RESET%
    echo %YELLOW%========================================%RESET%
    echo.
    echo %YELLOW%Některé soubory nebyly nalezeny nebo odstraněny.%RESET%
    echo %WHITE%Mod pravděpodobně nebyl kompletně nainstalován.%RESET%
)

echo.
echo %MAGENTA%Děkujeme za používání Professional Glock Mod!%RESET%
echo.
set /p "VERIFY=Chcete ověřit integritu hry ve Steam? (ano/ne): "
if /i "!VERIFY!"=="ano" (
    echo %CYAN%Spouštím Steam pro ověření integrity...%RESET%
    start steam://validate/!GAME_APPID!
)

echo.
pause
