# Windows Update via GPO — Gebruikte commando's

---

## GPO aanmaken en koppelen

```powershell
# Nieuwe GPO aanmaken
New-GPO -Name "Windows Update Beleid" `
  -Comment "Automatische updates configureren voor alle clients"

# GPO koppelen aan domein
New-GPLink -Name "Windows Update Beleid" -Target "DC=lab,DC=local"

# GPO status controleren
Get-GPO -Name "Windows Update Beleid"

# Alle GPOs bekijken
Get-GPO -All | Select-Object DisplayName, GpoStatus
```

---

## GPO instellingen via PowerShell

```powershell
# Automatische updates inschakelen
Set-GPRegistryValue -Name "Windows Update Beleid" `
  -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
  -ValueName "AUOptions" `
  -Type DWord -Value 4

# Installatie tijdstip instellen op 02:00
Set-GPRegistryValue -Name "Windows Update Beleid" `
  -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
  -ValueName "ScheduledInstallTime" `
  -Type DWord -Value 2

# Elke dag installeren
Set-GPRegistryValue -Name "Windows Update Beleid" `
  -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
  -ValueName "ScheduledInstallDay" `
  -Type DWord -Value 0

# Geen automatische herstart met ingelogde gebruikers
Set-GPRegistryValue -Name "Windows Update Beleid" `
  -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
  -ValueName "NoAutoRebootWithLoggedOnUsers" `
  -Type DWord -Value 1

# Updates inschakelen
Set-GPRegistryValue -Name "Windows Update Beleid" `
  -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
  -ValueName "NoAutoUpdate" `
  -Type DWord -Value 0
```

---

## GPO toepassen op clients

```powershell
# GPO forceren op client
gpupdate /force

# GPO toepassing controleren
gpresult /r

# Specifiek Windows Update policies bekijken
gpresult /r | findstr "Windows Update"
```

---

## Registry controleren op client

```powershell
# Windows Update AU policy instellingen
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

# Windows Update policy instellingen
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"

# AUOptions waarden:
# 2 = Notify before download
# 3 = Auto download and notify for install
# 4 = Auto download and schedule install
# 5 = Allow local admin to choose setting
```

---

## Windows Update service beheer

```powershell
# Service status bekijken
Get-Service -Name wuauserv

# Service starten
Start-Service -Name wuauserv

# Service herstarten
Restart-Service -Name wuauserv

# Service automatisch opstarten
Set-Service -Name wuauserv -StartupType Automatic

# Updates handmatig controleren via PowerShell
$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")
Write-Host "Beschikbare updates: $($updates.Updates.Count)"
```
