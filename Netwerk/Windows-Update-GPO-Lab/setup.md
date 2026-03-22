# Windows Update via GPO — Setup

Stap voor stap uitleg van hoe ik Windows Update via Group Policy
heb geconfigureerd.

---

## Stap 1 — GPO aanmaken via PowerShell

```powershell
# Nieuwe GPO aanmaken
New-GPO -Name "Windows Update Beleid" `
  -Comment "Automatische updates configureren voor alle clients"

# GPO koppelen aan domein
New-GPLink -Name "Windows Update Beleid" `
  -Target "DC=lab,DC=local"
```

---

## Stap 2 — GPO configureren via GPMC

```powershell
gpmc.msc
```

In GPMC:
1. Klik op lab.local → Group Policy Objects
2. Klik rechts op Windows Update Beleid → Edit
3. Navigeer naar:
   Computer Configuration → Policies → Administrative Templates
   → Windows Components → Windows Update → Manage end user experience

Instellingen geconfigureerd:

- Configure Automatic Updates: Enabled
  - Auto download and schedule the install
  - Scheduled install day: Every day
  - Scheduled install time: 02:00
- No auto-restart with logged on users: Enabled

---

## Stap 3 — GPO toepassen op clients

Op Windows 10 en Windows 11 VM:

```powershell
# GPO forceren
gpupdate /force

# Controleer welke policies zijn toegepast
gpresult /r
```

---

## Stap 4 — Registry controleren op client

```powershell
# Windows Update policy instellingen bekijken
Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

# Resultaat:
# AUOptions            : 4  (Auto download and schedule install)
# ScheduledInstallDay  : 0  (Every day)
# ScheduledInstallTime : 2  (02:00 AM)
# NoAutoRebootWithLoggedOnUsers : 1 (Enabled)
```

---

## Stap 5 — Windows Update service controleren

```powershell
# Service status bekijken
Get-Service -Name wuauserv

# Service herstarten
Restart-Service -Name wuauserv

# Controleer of policy is toegepast
Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
```

---

## Wat ik heb geleerd

- Hoe Windows Update gecentraliseerd beheerd wordt via GPO
- Hoe je voorkomt dat updates tijdens werktijd worden geinstalleerd
- Hoe je registry instellingen controleert voor GPO toepassing
- Het belang van update beheer in een bedrijfsomgeving
