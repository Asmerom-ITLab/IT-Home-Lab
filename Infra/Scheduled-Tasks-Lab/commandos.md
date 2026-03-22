# Scheduled Tasks — Gebruikte commando's

---

## Taken bekijken

```powershell
# Alle taken bekijken
Get-ScheduledTask

# Specifieke taken zoeken
Get-ScheduledTask | Where-Object {
    $_.TaskName -like "*Rapport*" -or
    $_.TaskName -like "*Inactieve*"
} | Select-Object TaskName, State

# Taak details bekijken
Get-ScheduledTask -TaskName "Dagelijks Systeem Rapport"
```

---

## Taken aanmaken via PowerShell

```powershell
# Taak 1 — Dagelijks systeem rapport om 08:00
$actie = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File C:\Scripts\systeem-rapport.ps1"

$trigger = New-ScheduledTaskTrigger -Daily -At 08:00

$instellingen = New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Hours 1)

Register-ScheduledTask `
    -TaskName "Dagelijks Systeem Rapport" `
    -Action $actie `
    -Trigger $trigger `
    -Settings $instellingen `
    -RunLevel Highest `
    -Force

# Taak 2 — Wekelijkse inactieve gebruikers check elke maandag om 09:00
$actie2 = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File C:\Scripts\inactieve-gebruikers.ps1"

$trigger2 = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Monday -At 09:00

Register-ScheduledTask `
    -TaskName "Wekelijkse Inactieve Gebruikers Check" `
    -Action $actie2 `
    -Trigger $trigger2 `
    -Settings $instellingen `
    -RunLevel Highest `
    -Force
```

---

## Taken starten en controleren

```powershell
# Taak handmatig starten
Start-ScheduledTask -TaskName "Dagelijks Systeem Rapport"

# Taak resultaat controleren
Get-ScheduledTaskInfo -TaskName "Dagelijks Systeem Rapport"

# LastTaskResult waarden:
# 0  = Succesvol uitgevoerd
# 1  = Fout opgetreden
# 267009 = Taak wordt nog uitgevoerd
```

---

## Taken beheren

```powershell
# Taak uitschakelen
Disable-ScheduledTask -TaskName "Dagelijks Systeem Rapport"

# Taak inschakelen
Enable-ScheduledTask -TaskName "Dagelijks Systeem Rapport"

# Taak verwijderen
Unregister-ScheduledTask -TaskName "Dagelijks Systeem Rapport" -Confirm:$false

# Alle taken exporteren
Get-ScheduledTask | Export-Csv "C:\Scripts\taken-overzicht.csv" -NoTypeInformation
```
