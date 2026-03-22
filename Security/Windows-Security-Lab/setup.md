# Windows Security Lab — Setup

Stap voor stap uitleg van hoe ik Windows Security heb geconfigureerd
op Windows Server 2025.

---

## Stap 1 — Defender status controleren

```powershell
Get-MpComputerStatus
```

Dit toont de huidige status van Microsoft Defender — of antivirus
aan staat, real-time bescherming actief is en wanneer de laatste
scan is uitgevoerd.

---

## Stap 2 — Real-time beveiliging inschakelen

```powershell
Set-MpPreference -DisableRealtimeMonitoring $false
Set-MpPreference -DisableBehaviorMonitoring $false
Set-MpPreference -DisableIOAVProtection $false
Set-MpPreference -DisableScriptScanning $false
Write-Host "Real-time beveiliging ingeschakeld!" -ForegroundColor Green
```

---

## Stap 3 — Defender definities bijwerken

```powershell
Update-MpSignature
Write-Host "Defender definities bijgewerkt!" -ForegroundColor Green
```

---

## Stap 4 — Quick scan uitvoeren

```powershell
Start-MpScan -ScanType QuickScan
Write-Host "Scan gestart!" -ForegroundColor Cyan
```

---

## Stap 5 — Firewall aanzetten

```powershell
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
Get-NetFirewallProfile | Select-Object Name, Enabled
```

---

## Stap 6 — Security event logs bekijken

```powershell
Get-EventLog -LogName Security -Newest 10 | Select-Object TimeGenerated, EntryType, InstanceId
```

---

## Stap 7 — Security rapport script aanmaken

Script opgeslagen in C:\Scripts\security-rapport.ps1

Het script draait automatisch via Scheduled Task elke dag om 08:00.

---

## Wat ik heb geleerd

- Hoe Microsoft Defender geconfigureerd wordt via PowerShell
- Hoe Windows Firewall profielen werken
- Hoe je security event logs leest en interpreteert
- Hoe je een automatisch security rapport maakt via PowerShell
- Het belang van beveiliging op een Windows Server
