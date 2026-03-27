# DC2 Redundancy Lab — Commando's

Overzicht van alle PowerShell commando's gebruikt in dit lab,
georganiseerd per categorie voor snelle naslag.

---

## Active Directory

```powershell
# Alle Domain Controllers tonen
Get-ADDomainController -Filter * | Select Name, IPv4Address, Site, IsGlobalCatalog, OperationMasterRoles

# Replicatie samenvatting controleren
repadmin /replsummary

# Replicatie details per DC
repadmin /showrepl

# Forceer directe replicatie van DC01 naar DC02
repadmin /syncall DC01 /AdeP

# AD services status op DC02
Get-Service adws, kdc, netlogon, dns | Select Name, Status

# DC02 verbinding met domein testen
nltest /dsgetdc:lab.local

# Alle AD gebruikers tonen
Get-ADUser -Filter * | Select Name, SamAccountName, Enabled
```

---

## DHCP

```powershell
# DHCP rol installeren op DC02 (uitvoeren op DC01)
Install-WindowsFeature -ComputerName DC02 -Name DHCP -IncludeManagementTools

# DC02 autoriseren als DHCP server
Add-DhcpServerInDC -DnsName "DC02.lab.local" -IPAddress 192.168.100.11

# Alle geautoriseerde DHCP servers tonen
Get-DhcpServerInDC

# Huidige DHCP scopes op DC01 tonen
Get-DhcpServerv4Scope

# Scope details tonen
Get-DhcpServerv4Scope | Select ScopeId, StartRange, EndRange, SubnetMask, State

# DHCP Failover instellen (Hot Standby)
Add-DhcpServerv4Failover `
  -Name "DC01-DC02-Failover" `
  -ScopeId 192.168.100.0 `
  -PartnerServer "DC02.lab.local" `
  -Mode HotStandby `
  -ServerRole Active `
  -StandbyPercent 0 `
  -AutoStateTransition $true `
  -MaxClientLeadTime 00:01:00 `
  -Force

# Failover status tonen
Get-DhcpServerv4Failover

# Scope op DC02 controleren
Get-DhcpServerv4Scope -ComputerName DC02.lab.local

# Actieve leases op DC01 tonen
Get-DhcpServerv4Lease -ScopeId 192.168.100.0

# Failover verwijderen (indien opnieuw instellen nodig)
Remove-DhcpServerv4Failover -Name "DC01-DC02-Failover" -Force
```

---

## File Server & SMB Shares

```powershell
# File Server en DFS rollen installeren op DC02 (uitvoeren op DC01)
Install-WindowsFeature -ComputerName DC02 `
  -Name FS-FileServer, FS-DFS-Namespace, FS-DFS-Replication `
  -IncludeManagementTools

# Mappen aanmaken op DC02 (uitvoeren op DC02)
New-Item -Path "C:\Shares\IT"         -ItemType Directory -Force
New-Item -Path "C:\Shares\HR"         -ItemType Directory -Force
New-Item -Path "C:\Shares\Finance"    -ItemType Directory -Force
New-Item -Path "C:\Shares\Management" -ItemType Directory -Force
New-Item -Path "C:\Shares\Algemeen"   -ItemType Directory -Force

# SMB Shares aanmaken op DC02
New-SmbShare -Name "IT"         -Path "C:\Shares\IT"         -FullAccess "lab\Domain Admins" -ReadAccess "lab\IT"
New-SmbShare -Name "HR"         -Path "C:\Shares\HR"         -FullAccess "lab\Domain Admins" -ReadAccess "lab\HR"
New-SmbShare -Name "Finance"    -Path "C:\Shares\Finance"    -FullAccess "lab\Domain Admins" -ReadAccess "lab\Finance"
New-SmbShare -Name "Management" -Path "C:\Shares\Management" -FullAccess "lab\Domain Admins" -ReadAccess "lab\Management"
New-SmbShare -Name "Algemeen"   -Path "C:\Shares\Algemeen"   -FullAccess "lab\Domain Admins" -ReadAccess "lab\Domain Users"

# Alle shares tonen op DC02
Get-SmbShare -CimSession DC02

# Share permissions tonen
Get-SmbShareAccess -Name "IT"
```

---

## DFS Replicatie

```powershell
# Replication Group aanmaken
New-DfsReplicationGroup -GroupName "Shares-Replication"

# Members toevoegen
Add-DfsrMember -GroupName "Shares-Replication" -ComputerName "DC01"
Add-DfsrMember -GroupName "Shares-Replication" -ComputerName "DC02"

# Gerepliceerde map aanmaken
New-DfsReplicatedFolder -GroupName "Shares-Replication" -FolderName "Shares"

# DC01 als primaire bron instellen
Set-DfsrMembership -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -ComputerName "DC01" `
  -ContentPath "C:\Shares" `
  -PrimaryMember $true `
  -Force

# DC02 als secundair instellen
Set-DfsrMembership -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -ComputerName "DC02" `
  -ContentPath "C:\Shares" `
  -PrimaryMember $false `
  -Force

# Replicatieverbinding aanmaken DC01 → DC02
Add-DfsrConnection -GroupName "Shares-Replication" `
  -SourceComputerName "DC01" `
  -DestinationComputerName "DC02"

# Replication Group status tonen
Get-DfsReplicationGroup

# Members status tonen
Get-DfsrMembership -GroupName "Shares-Replication"

# Backlog tonen (hoeveel bestanden nog gesynchroniseerd worden)
Get-DfsrBacklog `
  -SourceComputerName DC01 `
  -DestinationComputerName DC02 `
  -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -Verbose

# Replicatie testen — testbestand aanmaken op DC01
New-Item -Path "C:\Shares\Algemeen\replicatie-test.txt" -ItemType File -Value "DFS replicatie werkt!"

# Na 10 seconden controleren op DC02
Start-Sleep -Seconds 10
Invoke-Command -ComputerName DC02 -ScriptBlock {
  Get-Item "C:\Shares\Algemeen\replicatie-test.txt"
}

# DFS service herstarten indien nodig
Restart-Service DFSR -Force
Invoke-Command -ComputerName DC02 -ScriptBlock { Restart-Service DFSR -Force }

# Replication Group verwijderen (indien opnieuw instellen nodig)
Remove-DfsReplicationGroup -GroupName "Shares-Replication" -RemoveReplicatedFolders -Force
```

---

## Windows Server Backup (DC02)

```powershell
# Windows Server Backup installeren
Install-WindowsFeature -Name Windows-Server-Backup -IncludeManagementTools

# Backup map aanmaken
New-Item -Path "C:\Backup" -ItemType Directory -Force

# Nieuwe backup policy aanmaken
$policy = New-WBPolicy

# C:\Shares toevoegen als backup bron
$fileSpec = New-WBFileSpec -FileSpec "C:\Shares"
Add-WBFileSpec -Policy $policy -FileSpec $fileSpec

# Backup bestemming instellen
$backupLocation = New-WBBackupTarget -VolumePath "C:\"
Add-WBBackupTarget -Policy $policy -Target $backupLocation

# Dagelijks schema instellen om 02:00
Set-WBSchedule -Policy $policy -Schedule 02:00

# VSS volledige backup inschakelen
Set-WBVssBackupOptions -Policy $policy -VssCopyBackup

# Policy opslaan
Set-WBPolicy -Policy $policy -Force

# Handmatige testbackup uitvoeren
Start-WBBackup -Policy (Get-WBPolicy)

# Backup resultaat controleren
Get-WBSummary

# Backup policy bekijken
Get-WBPolicy

# Backup schema bekijken
Get-WBSchedule -Policy (Get-WBPolicy)

# Herstel testen — bestand terugzetten
Remove-Item "C:\Shares\Algemeen\herstel-test.txt" -Force

wbadmin start recovery `
  -version:(Get-WBSummary).LastSuccessfulBackupTime.ToString("MM/dd/yyyy-HH:mm") `
  -itemType:File `
  -items:"C:\Shares\Algemeen\herstel-test.txt" `
  -recoveryTarget:"C:\Shares\Algemeen" `
  -quiet
```

---

## Troubleshooting

```powershell
# DHCP service herstarten op DC02
Invoke-Command -ComputerName DC02 -ScriptBlock {
  Restart-Service DHCPServer -Force
  Get-Service DHCPServer | Select Name, Status
}

# DFS replicatie fouten bekijken
Get-WinEvent -LogName "DFS Replication" -MaxEvents 20 | Select TimeCreated, Message

# AD replicatie fouten bekijken
repadmin /showrepl * /errorsonly

# DHCP event log bekijken
Get-WinEvent -ComputerName DC02 -LogName "Microsoft-Windows-Dhcp-Client/Admin" -MaxEvents 10

# Netwerk verbinding DC01 naar DC02 testen
Test-NetConnection -ComputerName DC02.lab.local -Port 445
Test-NetConnection -ComputerName DC02.lab.local -Port 135

# Shares bereikbaar testen vanaf client
Test-Path "\\DC02.lab.local\Algemeen"
```
