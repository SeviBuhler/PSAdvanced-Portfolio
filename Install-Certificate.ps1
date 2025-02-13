# Als Administrator ausführen prüfen
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Bitte als Administrator ausführen!"
    break
}

# Zertifikat in den Trusted Root Store importieren
$cerPath = "$PSScriptRoot\DTCertificate.cer"
if (Test-Path $cerPath) {
    Import-Certificate -FilePath $cerPath -CertStoreLocation "Cert:\LocalMachine\Root"
    Write-Host "Zertifikat wurde erfolgreich installiert!" -ForegroundColor Green
} else {
    Write-Error "Zertifikat nicht gefunden!"
}

# ExecutionPolicy setzen
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Scope LocalMachine
Write-Host "ExecutionPolicy wurde auf RemoteSigned gesetzt." -ForegroundColor Green
