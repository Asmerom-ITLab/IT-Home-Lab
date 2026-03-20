# Chocolatey — Gebruikte commando's

---

## Installatie

```powershell
# Chocolatey installeren
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Versie controleren
choco --version

# Help bekijken
choco --help
```

---

## Software installeren

```powershell
# Enkelvoudige installatie
choco install 7zip -y
choco install notepadplusplus -y
choco install googlechrome -y
choco install vlc -y
choco install vscode -y
choco install git -y

# Meerdere tegelijk installeren
choco install 7zip notepadplusplus googlechrome vlc -y

# Specifieke versie installeren
choco install googlechrome --version 120.0.6099.71 -y
```

---

## Software beheren

```powershell
# Geinstalleerde software bekijken
choco list

# Beschikbare updates bekijken
choco outdated

# Specifieke software updaten
choco upgrade 7zip -y

# Alle software updaten
choco upgrade all -y

# Software verwijderen
choco uninstall 7zip -y

# Software zoeken
choco search notepad
```

---

## Automatisering script

```powershell
# software-uitrollen.ps1
# Vereist: Chocolatey geinstalleerd, PowerShell als Administrator

$software = @(
    "7zip",
    "notepadplusplus",
    "googlechrome",
    "vlc"
)

Write-Host "===== SOFTWARE INSTALLATIE =====" -ForegroundColor Cyan
Write-Host ""

foreach ($pakket in $software) {
    Write-Host "Installeren: $pakket..." -ForegroundColor Yellow
    choco install $pakket -y --no-progress
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Klaar: $pakket" -ForegroundColor Green
    } else {
        Write-Host "Fout bij: $pakket" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "===== KLAAR =====" -ForegroundColor Cyan
Write-Host ""
choco list
```

---

## Chocolatey configuratie

```powershell
# Chocolatey configuratie bekijken
choco config list

# Cache map instellen
choco config set cacheLocation "C:\ChocolateyCache"

# Timeout instellen
choco config set commandExecutionTimeoutSeconds 300

# Chocolatey updaten
choco upgrade chocolatey -y
```
