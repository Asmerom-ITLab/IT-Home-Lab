# Active Directory — Gebruikte commando's

Alle PowerShell commando's die ik heb gebruikt tijdens de lab.

---

## Netwerk configuratie

```powershell
# Netwerkadapters bekijken
Get-NetAdapter

# Statisch IP instellen
New-NetIPAddress -InterfaceAlias "LAN" `
  -IPAddress 192.168.100.10 `
  -PrefixLength 24 `
  -DefaultGateway 192.168.100.2

# DNS instellen
Set-DnsClientServerAddress -InterfaceAlias "LAN" `
  -ServerAddresses 127.0.0.1

# IP controleren
ipconfig /all
Get-NetIPAddress -AddressFamily IPv4

# Verbinding testen
ping 8.8.8.8
ping 192.168.100.10
```

---

## Server configuratie

```powershell
# Server hernoemen
Rename-Computer -NewName "DC01" -Restart

# Hostname controleren
hostname
```

---

## Active Directory installatie

```powershell
# AD DS rol installeren
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Domein aanmaken
Install-ADDSForest `
  -DomainName "lab.local" `
  -DomainNetbiosName "LAB" `
  -InstallDns:$true `
  -Force:$true

# Domein controleren
Get-ADDomain
Get-ADDomainController

# DNS controleren
Resolve-DnsName lab.local
```

---

## DHCP configuratie

```powershell
# DHCP rol installeren
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# DHCP autoriseren in AD
Add-DhcpServerInDC -DnsName "DC01.lab.local" -IPAddress 192.168.100.10

# DHCP scope aanmaken
Add-DhcpServerv4Scope `
  -Name "Lab Netwerk" `
  -StartRange 192.168.100.50 `
  -EndRange 192.168.100.150 `
  -SubnetMask 255.255.255.0 `
  -State Active

# Gateway en DNS instellen voor clients
Set-DhcpServerv4OptionValue `
  -ScopeId 192.168.100.0 `
  -Router 192.168.100.2 `
  -DnsServer 192.168.100.10 `
  -DnsDomain "lab.local"

# DHCP controleren
Get-DhcpServerv4Scope
Get-DhcpServerInDC
```

---

## Domain Join (op de client)

```powershell
# DNS instellen op client
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" `
  -ServerAddresses 192.168.100.10

# DNS testen
Resolve-DnsName lab.local

# Joinen aan domein
Add-Computer `
  -DomainName "lab.local" `
  -Credential LAB\Administrator `
  -Restart

# Computers in AD controleren (op server)
Get-ADComputer -Filter * | Select-Object Name
```

---

## Gebruikers en groepen

```powershell
# Groepen aanmaken
New-ADGroup -Name "HR-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "IT-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Management-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Finance-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Sales-Groep" -GroupScope Global -GroupCategory Security

# Gebruiker aanmaken
New-ADUser `
  -Name "hr-user1" `
  -UserPrincipalName "hr-user1@lab.local" `
  -AccountPassword (ConvertTo-SecureString "Welkom@123" -AsPlainText -Force) `
  -Enabled $true

# Gebruiker toevoegen aan groep
Add-ADGroupMember -Identity "HR-Groep" -Members "hr-user1"

# Groepsleden controleren
Get-ADGroupMember -Identity "HR-Groep"

# Alle gebruikers tellen
Get-ADUser -Filter * | Measure-Object

# Alle groepen bekijken
Get-ADGroup -Filter *
```

---

## File Server

```powershell
# Mappen aanmaken
New-Item -Path "C:\Shares\HR" -ItemType Directory
New-Item -Path "C:\Shares\IT" -ItemType Directory
New-Item -Path "C:\Shares\Management" -ItemType Directory
New-Item -Path "C:\Shares\Finance" -ItemType Directory
New-Item -Path "C:\Shares\Sales" -ItemType Directory

# Mappen delen
New-SmbShare -Name "HR" -Path "C:\Shares\HR" -Description "HR Afdeling"
New-SmbShare -Name "IT" -Path "C:\Shares\IT" -Description "IT Afdeling"

# Shares controleren
Get-SmbShare
```

---

## Handige controle commando's

```powershell
# AD module laden
Import-Module ActiveDirectory

# Domein info
Get-ADDomain

# Domain Controller info
Get-ADDomainController

# Alle gebruikers
Get-ADUser -Filter * | Select-Object Name, Enabled

# Alle computers in AD
Get-ADComputer -Filter * | Select-Object Name

# Services controleren
Get-Service ADWS, DNS, DHCPServer, Netlogon
```
