$steam = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\WindowsNoEditor\"
$epic = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\EGS\"
$microsoft = "$($ENV:LOCALAPPDATA)\DeadByDaylight\Saved\Config\WinGDK\"

Write-Output "Note: This will not guarantee the game will run at 120 fps, it simply unlocks the game to run UP TO that frame rate. The game is also capped at 120 frames per second, so that is the maximum achievable frame rate."

if(Test-Path -Path $steam)
{
    Write-Output "Found Steam Version"
    (Get-Content -Path "$($steam)\GameUserSettings.ini" -Raw) -replace "FPSLimit=30", "FPSLimit=120" | Set-Content -Path "$($steam)\GameUserSettings.ini"
    (Get-Content -Path "$($steam)\GameUserSettings.ini" -Raw) -replace "bUseVSync=True", "bUseVSync=False" | Set-Content -Path "$($steam)\GameUserSettings.ini"
    "" |Add-Content -Path "$($steam)\Engine.ini"
    "[/script/engine.engine]" | Add-Content -Path "$($steam)\Engine.ini"
    "bSmoothFrameRate=false" | Add-Content -Path "$($steam)\Engine.ini"
    Write-Output "Patched Steam Version"
}
if(Test-Path -Path $epic)
{
    Write-Output "Found Epic Games Version"
    (Get-Content -Path "$($epic)\GameUserSettings.ini" -Raw) -replace "FPSLimit=30", "FPSLimit=120" | Set-Content -Path "$($epic)\GameUserSettings.ini"
    (Get-Content -Path "$($epic)\GameUserSettings.ini" -Raw) -replace "bUseVSync=True", "bUseVSync=False" | Set-Content -Path "$($epic)\GameUserSettings.ini"
    "" |Add-Content -Path "$($steam)\Engine.ini"
    "[/script/engine.engine]" | Add-Content -Path "$($epic)\Engine.ini"
    "bSmoothFrameRate=false" | Add-Content -Path "$($epic)\Engine.ini"
    Write-Output "Patched Epic Games Version"
}
if(Test-Path -Path $microsoft)
{
    Write-Output "Found Windows Store/Game Pass Version"
    (Get-Content -Path "$($microsoft)\GameUserSettings.ini" -Raw) -replace "FPSLimit=30", "FPSLimit=120" | Set-Content -Path "$($microsoft)\GameUserSettings.ini"
    (Get-Content -Path "$($microsoft)\GameUserSettings.ini" -Raw) -replace "bUseVSync=True", "bUseVSync=False" | Set-Content -Path "$($microsoft)\GameUserSettings.ini"
    "" |Add-Content -Path "$($steam)\Engine.ini"
    "[/script/engine.engine]" | Add-Content -Path "$($microsoft)\Engine.ini"
    "bSmoothFrameRate=false" | Add-Content -Path "$($microsoft)\Engine.ini"
    Write-Output "Patched Found Windows Store/Game Pass Version"
}