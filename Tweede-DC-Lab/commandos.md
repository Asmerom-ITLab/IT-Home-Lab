# Tweede Domain Controller — Gebruikte commando's

---

## DC02 voorbereiden

```powershell
# Hostname controleren
hostname

# IP instellen
Remove-NetIPAddress -InterfaceAlias "LAN" -Confirm:$false
Remove-NetRoute -InterfaceAlias "LAN" -DestinationPrefix 0.0.0.0/0 -Confirm:$false

New-NetIPAddress -InterfaceAlias "LAN" `
  -IPAddress 192.168.100.11 `
  -PrefixLength 24 `
  -DefaultGateway 192.168.100.2

Set-DnsClientServerAddress -InterfaceAlias "LAN" `
  -ServerAddresses 192.168.100.10

# Connectiviteit testen
ping 192.168.100.10
ping 8.8.8.8
Resolve-DnsName lab.local
```

---

## Onnodige rollen verwijderen

```powershell
# IIS verwijderen
Remove-WindowsFeature -Name Web-Server -IncludeManagementTools

# File Server verwijderen
Remove-WindowsFeature -Name FS-FileServer

# Windows Server Backup verwijderen
Remove-WindowsFeature -Name Windows-Server-Backup

# WSUS tools verwijderen
Remove-WindowsFeature -Name UpdateServices-RSAT, UpdateServices-API

# Herstart
Restart-Computer -Force
```

---

## AD DS installeren

```powershell
# AD DS rol installeren
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Installatie controleren
Get-WindowsFeature -Name AD-Domain-Services
```

---

## DC02 promoveren als Domain Controller

```powershell
# Credential aanmaken
$user = "LAB\Administrator"
$wachtwoord = Read-Host "Voer je wachtwoord in" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential($user, $wachtwoord)

# DC02 promoveren
Install-ADDSDomainController `
  -DomainName "lab.local" `
  -Credential $cred `
  -InstallDns:$true `
  -Force:$true
```

---

## Replicatie controleren

```powershell
# Alle Domain Controllers bekijken
Get-ADDomainController -Filter * | Select-Object Name, IPv4Address, Site

# Replicatie status controleren
repadmin /replsummary

# Replicatie forceren
repadmin /syncall /AdeP

# Replicatie partners bekijken
repadmin /showrepl
```

---

## Failover testen

```powershell
# Op DC01 — tijdelijk uitzetten voor test
# (doe dit via VMware — VM pauzeren)

# Op Windows 10 client controleren
# Nog steeds inloggen met domein account?
whoami
gpupdate /force

# Op DC02 controleren of hij overneemt
Get-ADDomain
netlogon
```

---

## Domain Controllers beheren

```powershell
# Alle DCs bekijken
Get-ADDomainController -Filter *

# DC info bekijken
Get-ADDomainController -Identity DC02

# FSMO rollen bekijken
netdom query fsmo

# FSMO rollen verplaatsen naar DC02
Move-ADDirectoryServerOperationMasterRole `
  -Identity DC02 `
  -OperationMasterRole PDCEmulator, RIDMaster, InfrastructureMaster
```
