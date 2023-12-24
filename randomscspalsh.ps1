# Created by: BearFather, PrimalStage


# PLEASE READ THE README.TXT FILE

# Services: -------------------

$random = New-Object -TypeName System.Random

# Variables: -------------------

$mainFolder = Split-Path -Path $PSScriptRoot -Parent
Write-Host $mainFolder
$replacementDirectory = Join-Path -Path $mainFolder -ChildPath "\SplashScreens\"
$replacementFolders = Get-ChildItem -Path $replacementDirectory -Directory

$folderName = "Roberts Space Industries"

# Get a list of all drives on the system
$drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -gt 0 } | Select-Object -ExpandProperty Root
$filePath = "$mainFolder\ExtraLinks\RSILocation.txt"



# Define the additional path you want to append
$additionalPath = "StarCitizen\LIVE\EasyAntiCheat\SplashScreen.png"
$RSILauncher = "RSI Launcher\RSI Launcher.exe"


# Display the full file path
$fullFilePath


# Main Code: ------------------
Write-Host "Thank you for using Primal's Spash Screen Creator!"
Write-Host "Version 0.2.2"
# Check if the file exists
if (Test-Path -Path $filePath -PathType Leaf) {

} else {
    Write-Host " ---------------------------- "
    Write-Host "It looks like you are opening this for the first time, please be patient as we look for your RSI Folder."
    Write-Host "Drives found: '$drives'"
    foreach ($drive in $drives) {
        Write-Host " ---------------------------- "
        Write-Host " "
        Write-Host "Scanning Drive: $drive"
        $results = Get-ChildItem -Path $drive -Filter $folderName -Directory -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty FullName
        if ($results) {
            $content = $results
            $results
            $content | Out-File -FilePath $filePath -NoNewLine
            break
        }
    }
}

# Combine $results with the additional path using Join-Path
$savedResults = Get-Content -Path $filePath -Raw
$fullFilePath = Join-Path -Path $savedResults -ChildPath $additionalPath


# replaces the immage
if ($replacementFolders.Count -gt 0) {
    $randomReplacementFolder = "$replacementDirectory$($replacementFolders[$random.Next(0, $replacementFolders.Count)])"
    $replacementImages = Get-ChildItem -Path $randomReplacementFolder -Filter "*.png" -File
    if ($replacementImages.Count -gt 0){
        $randomReplacement = $replacementImages[$random.Next(0, $replacementImages.Count)]
        $imageToReplace = Join-Path -Path $savedResults -ChildPath $additionalPath
        Copy-Item -Path $randomReplacement.FullName -Destination $imageToReplace -Force
        Write-Host "Replaced '$imageToReplace' with '$($randomReplacement.FullName)'"   
    }
    else {
        Write-Host "No replacement images found in the directory."
    }
}
else {
    Write-Host "No replacement folders found in the directory."
}

#Makes the Shortcut

if (Test-Path -Path "$([System.Environment]::GetFolderPath('Desktop'))\RSI Launcher (BETA).lnk" -PathType Leaf) {
    Write-Host "found file"
}
else {
    $x = Join-Path -Path $mainFolder -ChildPath "\ExtraLinks\randomscspalsh.ps1"
    Write-Host $x
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$([System.Environment]::GetFolderPath('Desktop'))\RSI Launcher (BETA).lnk")
    $Shortcut.IconLocation = Join-Path -Path $mainFolder -ChildPath "\ExtraLinks\RSI Beta Logo.ico"
    $Shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    $Shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$x`""  # Pass the arguments separately
    $Shortcut.Save()
}

$RSILauncherRunner = Join-Path -Path $savedResults -ChildPath $RSILauncher
Write-Host $RSILauncherRunner
Start-Process -FilePath $RSILauncherRunner