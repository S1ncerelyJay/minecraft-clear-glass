$jarExe = "C:\Users\18199\AppData\Roaming\.minecraft\runtime\java-runtime-epsilon\bin\jar.exe"
$outDir = "$PSScriptRoot\dist"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }
$outZip = "$outDir\Clear Glass.zip"
if (Test-Path $outZip) { Remove-Item $outZip -Force }

Push-Location $PSScriptRoot
& $jarExe -cMf "$outZip" pack.mcmeta pack.png assets/
Pop-Location

Write-Host "Packaged successfully: $outZip ($((Get-Item $outZip).Length) bytes)"
