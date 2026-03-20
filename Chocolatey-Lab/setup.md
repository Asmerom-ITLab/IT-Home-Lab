# Chocolatey Lab — Setup

Stap voor stap uitleg van hoe ik Chocolatey heb geinstalleerd
op Windows Server 2025, Windows 10 en Windows 11.

---

## Stap 1 — Chocolatey installeren op Windows Server

Open PowerShell als Administrator op Windows Server 2025:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Versie controleren:

```powershell
choco --version
```

---

## Stap 2 — Software installeren op server

```powershell
# Meerdere pakketten tegelijk installeren
choco install 7zip notepadplusplus googlechrome vlc -y
```

---

## Stap 3 — Geinstalleerde software bekijken

```powershell
choco list
```

---

## Stap 4 — Alle software updaten

```powershell
choco upgrade all -y
```

---

## Stap 5 — Chocolatey installeren op Windows 10 client

Op Windows 10 VM open PowerShell als Administrator:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Test installatie:

```powershell
choco install 7zip -y
choco list
```

---

## Stap 6 — Netwerk probleem oplossen op Windows 11

Voor de installatie op Windows 11 was de Default Gateway verkeerd
ingesteld op 192.168.100.1 in plaats van 192.168.100.2.

Opgelost via:

```powershell
# Oud IP verwijderen
Remove-NetIPAddress -InterfaceAlias "Ethernet0" -Confirm:$false
Remove-NetRoute -InterfaceAlias "Ethernet0" -DestinationPrefix 0.0.0.0/0 -Confirm:$false

# Correct IP instellen
New-NetIPAddress -InterfaceAlias "Ethernet0" `
  -IPAddress 192.168.100.13 `
  -PrefixLength 24 `
  -DefaultGateway 192.168.100.2

# DNS instellen
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" `
  -ServerAddresses 192.168.100.10
```

Daarna internet getest:

```powershell
ping 8.8.8.8
```

---

## Stap 7 — Chocolatey installeren op Windows 11 client

Na het oplossen van het netwerk probleem:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Test installatie:

```powershell
choco install 7zip -y
choco list
```

---

## Resultaat

Chocolatey succesvol geinstalleerd op alle drie de machines:
- Windows Server 2025 — 4 pakketten geinstalleerd
- Windows 10 Client — getest met 7zip
- Windows 11 Client — getest met 7zip

---

## Wat ik heb geleerd

- Hoe Chocolatey werkt als package manager voor Windows
- Hoe je software installeert via de command line
- Hoe je software up to date houdt via choco upgrade
- Hoe je netwerk problemen oplost op een domein client
- Het belang van geautomatiseerde software installatie in IT
