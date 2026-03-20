# Chocolatey Lab — Setup

Stap voor stap uitleg van hoe ik Chocolatey heb geinstalleerd
en geconfigureerd op Windows Server 2025.

---

## Stap 1 — Chocolatey installeren

Open PowerShell als Administrator op Windows Server:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Controleren of installatie gelukt is:

```powershell
choco --version
```

---

## Stap 2 — Software installeren

```powershell
# 7-Zip installeren
choco install 7zip -y

# Notepad++ installeren
choco install notepadplusplus -y

# Meerdere tegelijk installeren
choco install 7zip notepadplusplus googlechrome vlc -y
```

---

## Stap 3 — Geinstalleerde software bekijken

```powershell
choco list
```

---

## Stap 4 — Software updaten

```powershell
# Alle software updaten
choco upgrade all -y

# Specifieke software updaten
choco upgrade 7zip -y
```

---

## Stap 5 — Chocolatey op Windows 10 client installeren

Op Windows 10 VM via PowerShell als Administrator:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

---

## Stap 6 — Software uitrollen via PowerShell script

Script aangemaakt om software op meerdere machines te installeren:

```powershell
# software-uitrollen.ps1
$software = @("7zip", "notepadplusplus", "googlechrome", "vlc")

foreach ($pakket in $software) {
    Write-Host "Installeren: $pakket" -ForegroundColor Cyan
    choco install $pakket -y
    Write-Host "Klaar: $pakket" -ForegroundColor Green
}

Write-Host "Alle software geinstalleerd!" -ForegroundColor Green
```

---

## Wat ik heb geleerd

- Hoe Chocolatey werkt als package manager voor Windows
- Hoe je software installeert via de command line
- Hoe je software up to date houdt via choco upgrade
- Hoe je software uitrolt naar meerdere machines via PowerShell
- Het belang van geautomatiseerde software installatie in IT
