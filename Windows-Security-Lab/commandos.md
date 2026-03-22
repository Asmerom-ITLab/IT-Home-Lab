# Windows Security Lab — Gebruikte commando's

---

## Microsoft Defender

```powershell
# Defender status bekijken
Get-MpComputerStatus

# Defender instellingen bekijken
Get-MpPreference

# Real-time beveiliging inschakelen
Set-MpPreference -DisableRealtimeMonitoring $false
Set-MpPreference -DisableBehaviorMonitoring $false
Set-MpPreference -DisableIOAVProtection $false
Set-MpPreference -DisableScriptScanning $false

# Defender definities bijwerken
Update-MpSignature

# Quick scan uitvoeren
Start-MpScan -ScanType QuickScan

# Volledige scan uitvoeren
Start-MpScan -ScanType FullScan

# Scan resultaten bekijken
Get-MpThreatDetection

# Bedreigingen bekijken
Get-MpThreat

# Defender uitsluitingen toevoegen
Add-MpPreference -ExclusionPath "C:\Scripts"
```

---

## Windows Firewall

```powershell
# Firewall status bekijken
Get-NetFirewallProfile | Select-Object Name, Enabled

# Alle firewall profielen aanzetten
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

# Specifiek profiel aanzetten
Set-NetFirewallProfile -Profile Domain -Enabled True

# Firewall regels bekijken
Get-NetFirewallRule | Select-Object Name, Enabled, Direction, Action

# Nieuwe firewall regel aanmaken
New-NetFirewallRule -DisplayName "Allow SSH" -Direction Inbound -Protocol TCP -LocalPort 22 -Action Allow

# Firewall regel verwijderen
Remove-NetFirewallRule -DisplayName "Allow SSH"
```

---

## Security Event Logs

```powershell
# Laatste 10 security events bekijken
Get-EventLog -LogName Security -Newest 10

# Specifieke event ID zoeken
Get-EventLog -LogName Security -InstanceId 4624 -Newest 5

# Event IDs:
# 4624 = Succesvol ingelogd
# 4625 = Mislukte inlogpoging
# 4634 = Uitgelogd
# 4648 = Inlogpoging met expliciete credentials
# 4720 = Gebruiker aangemaakt
# 4726 = Gebruiker verwijderd

# Gefilterde events bekijken
Get-EventLog -LogName Security -EntryType FailureAudit -Newest 10

# Events exporteren
Get-EventLog -LogName Security -Newest 100 | Export-Csv "C:\Scripts\security-events.csv" -NoTypeInformation
```

---

## Security Rapport Script

```powershell
# security-rapport.ps1
Write-Host "===== SECURITY RAPPORT =====" -ForegroundColor Cyan
Write-Host "Server: $env:COMPUTERNAME" -ForegroundColor Cyan
Write-Host "Datum: $(Get-Date -Format 'dd-MM-yyyy HH:mm')" -ForegroundColor Cyan

Write-Host ""
Write-Host "MICROSOFT DEFENDER" -ForegroundColor Yellow
$status = Get-MpComputerStatus
Write-Host "Antivirus ingeschakeld: $($status.AntivirusEnabled)"
Write-Host "Real-time bescherming: $($status.RealTimeProtectionEnabled)"
Write-Host "Definitie versie: $($status.AntivirusSignatureVersion)"
Write-Host "Laatste scan: $($status.LastQuickScanEndTime)"

Write-Host ""
Write-Host "FIREWALL" -ForegroundColor Yellow
Get-NetFirewallProfile | ForEach-Object {
    Write-Host "$($_.Name) profiel: $($_.Enabled)"
}

Write-Host ""
Write-Host "LAATSTE SECURITY EVENTS" -ForegroundColor Yellow
Get-EventLog -LogName Security -Newest 5 | ForEach-Object {
    Write-Host "$($_.TimeGenerated) - $($_.EntryType) - $($_.InstanceId)"
}

Write-Host ""
Write-Host "WINDOWS UPDATE" -ForegroundColor Yellow
$wu = Get-WmiObject -Class Win32_QuickFixEngineering | Sort-Object InstalledOn -Descending | Select-Object -First 3
foreach ($update in $wu) {
    Write-Host "Update: $($update.HotFixID) - Geinstalleerd: $($update.InstalledOn)"
}

Write-Host ""
Write-Host "===== KLAAR =====" -ForegroundColor Cyan
```

---

## Windows Update via PowerShell

```powershell
# Geinstalleerde updates bekijken
Get-WmiObject -Class Win32_QuickFixEngineering | Sort-Object InstalledOn -Descending

# Windows Update service status
Get-Service -Name wuauserv

# Updates controleren
$updateSession = New-Object -ComObject Microsoft.Update.Session
$updateSearcher = $updateSession.CreateUpdateSearcher()
$updates = $updateSearcher.Search("IsInstalled=0")
Write-Host "Beschikbare updates: $($updates.Updates.Count)"
```
