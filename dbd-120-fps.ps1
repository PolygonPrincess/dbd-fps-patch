$steam = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\WindowsNoEditor\"
$epic = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\EGS\"
$microsoft = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\WinGDK\"
$dirs = @($steam,$epic,$microsoft)
$vers = @("Steam", "Epic Games", "Windows Store/Game Pass")

Write-Host "Note: This will not guarantee the game will run at 120 fps, it simply unlocks the game to run UP TO that frame rate. `nThe game is capped at 120 frames per second, so that is the maximum achievable frame rate. `nThis script requires the values in the config files to be set to their default." -ForegroundColor Yellow -BackgroundColor Black
Read-Host -Prompt "Press enter to patch any version of the game currently installed."

For ($i = 0; $i -lt 3; $i++) {
    if(Test-Path -Path $dirs[$i])
    {
        Write-Host "Found files for the $($vers[$i]) version." -ForegroundColor Yellow -BackgroundColor Black
        (Get-Content -Path "$($dirs[$i])\GameUserSettings.ini" -Raw) -replace "FPSLimit=30", "FPSLimit=120" | Set-Content -Path "$($dirs[$i])\GameUserSettings.ini"
        (Get-Content -Path "$($dirs[$i])\GameUserSettings.ini" -Raw) -replace "bUseVSync=True", "bUseVSync=False" | Set-Content -Path "$($dirs[$i])\GameUserSettings.ini"
        "" |Add-Content -Path "$($dirs[$i])\Engine.ini"
        "[/script/engine.engine]" | Add-Content -Path "$($dirs[$i])\Engine.ini"
        "bSmoothFrameRate=false" | Add-Content -Path "$($dirs[$i])\Engine.ini"
        Write-Host "All files for the $($vers[$i]) version have been patched" -ForegroundColor Yellow -BackgroundColor Black
        cmd /c pause
    }
    else{
        Write-Host "Did not find any files for the $($vers[$i]) version. Are you sure this version of the game is installed? You can ignore this message if you do not own this version." -ForegroundColor Yellow -BackgroundColor Black
        cmd /c pause
    }
}

Write-Host""
Write-Host "All versions installed (if any) have been patched. `nPlease test to verify the game's framerate is unlocked to 120 FPS." -ForegroundColor Yellow -BackgroundColor Black
cmd /c pause
