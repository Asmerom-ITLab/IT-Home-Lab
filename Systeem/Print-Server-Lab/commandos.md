# Print Server — Gebruikte commando's

---

## Print Server installatie

```powershell
# Print Server rol installeren
Install-WindowsFeature -Name Print-Server, Print-Internet -IncludeManagementTools

# Installatie controleren
Get-WindowsFeature -Name Print-Server
```

---

## Printer aanmaken

```powershell
# Printer driver installeren
Add-PrinterDriver -Name "Generic / Text Only"

# Beschikbare drivers bekijken
Get-PrinterDriver

# Printer aanmaken
Add-Printer `
  -Name "Lab-Printer" `
  -DriverName "Generic / Text Only" `
  -PortName "LPT1:" `
  -Shared:$true `
  -ShareName "Lab-Printer"

# Printer controleren
Get-Printer -Name "Lab-Printer"

# Alle printers bekijken
Get-Printer
```

---

## Printer beheren

```powershell
# Printer eigenschappen bekijken
Get-Printer -Name "Lab-Printer" | Format-List *

# Printer verwijderen
Remove-Printer -Name "Lab-Printer"

# Printer poorten bekijken
Get-PrinterPort

# Print queue bekijken
Get-PrintJob -PrinterName "Lab-Printer"

# Print jobs verwijderen
Get-PrintJob -PrinterName "Lab-Printer" | Remove-PrintJob
```

---

## GPO voor printer uitrollen

```powershell
# GPO aanmaken
New-GPO -Name "Printer Beleid"
New-GPLink -Name "Printer Beleid" -Target "DC=lab,DC=local"
```

Via gpmc.msc:
```
User Configuration → Preferences → Control Panel Settings
→ Printers → New → Shared Printer
Share path: \\DC01\Lab-Printer
```

---

## Printer testen op client

```powershell
# GPO forceren
gpupdate /force

# Printers bekijken
Get-Printer

# Printer handmatig toevoegen
Add-Printer -ConnectionName "\\DC01\Lab-Printer"

# Printer verwijderen
Remove-Printer -Name "Lab-Printer on DC01"
```

---

## Print Management

```powershell
# Print Management openen
printmanagement.msc

# Print Spooler service controleren
Get-Service -Name Spooler

# Print Spooler herstarten
Restart-Service -Name Spooler
```
