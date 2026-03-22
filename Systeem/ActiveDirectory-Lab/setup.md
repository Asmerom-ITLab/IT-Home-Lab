# Active Directory Lab — Setup

Stap voor stap uitleg van hoe ik de Active Directory lab heb uitgevoerd.

---

## Stap 1 — VMware NAT netwerk instellen

Eerst heb ik een virtueel netwerk aangemaakt in VMware Workstation.

Via Edit → Virtual Network Editor → VMnet8 heb ik dit ingesteld:

| Instelling | Waarde |
|---|---|
| Type | NAT |
| Subnet IP | 192.168.100.0 |
| Subnet mask | 255.255.255.0 |
| Gateway | 192.168.100.2 |
| DHCP start | 192.168.100.50 |
| DHCP einde | 192.168.100.150 |

De Windows Server 2025 VM heb ik daarna gekoppeld aan VMnet8.

---

## Stap 2 — Statisch IP instellen

Een Domain Controller heeft altijd een vast IP nodig zodat clients
hem altijd kunnen vinden.

```powershell
New-NetIPAddress -InterfaceAlias "LAN" `
  -IPAddress 192.168.100.10 `
  -PrefixLength 24 `
  -DefaultGateway 192.168.100.2

Set-DnsClientServerAddress -InterfaceAlias "LAN" `
  -ServerAddresses 127.0.0.1
```

---

## Stap 3 — Server hernoemen naar DC01

```powershell
Rename-Computer -NewName "DC01" -Restart
```

Na de herstart is de server bekend als DC01 in het netwerk.

---

## Stap 4 — AD DS rol installeren

```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
```

Dit voegt alle benodigde software toe voor Active Directory.
De server herstart nog niet na dit commando.

---

## Stap 5 — Domein aanmaken

```powershell
Install-ADDSForest `
  -DomainName "lab.local" `
  -DomainNetbiosName "LAB" `
  -InstallDns:$true `
  -Force:$true
```

Tijdens de installatie heb ik een DSRM wachtwoord ingesteld.
De server herstart automatisch na de installatie.

Na de herstart log je in met LAB\Administrator.

---

## Stap 6 — Installatie controleren

```powershell
Get-ADDomain
Get-ADDomainController
Resolve-DnsName lab.local
```

Alle drie de commando's gaven de juiste output terug.

---

## Stap 7 — DHCP installeren

```powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools

Add-DhcpServerInDC -DnsName "DC01.lab.local" -IPAddress 192.168.100.10

Add-DhcpServerv4Scope `
  -Name "Lab Netwerk" `
  -StartRange 192.168.100.50 `
  -EndRange 192.168.100.150 `
  -SubnetMask 255.255.255.0 `
  -State Active

Set-DhcpServerv4OptionValue `
  -ScopeId 192.168.100.0 `
  -Router 192.168.100.2 `
  -DnsServer 192.168.100.10 `
  -DnsDomain "lab.local"
```

---

## Stap 8 — Clients joinen aan domein

Op de Windows 10 en Windows 11 VM heb ik DNS ingesteld:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" `
  -ServerAddresses 192.168.100.10
```

Daarna gejoined aan het domein:

```powershell
Add-Computer `
  -DomainName "lab.local" `
  -Credential LAB\Administrator `
  -Restart
```

---

## Stap 9 — Gebruikers en groepen aanmaken

5 security groepen aangemaakt:

```powershell
New-ADGroup -Name "HR-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "IT-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Management-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Finance-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Sales-Groep" -GroupScope Global -GroupCategory Security
```

20 gebruikers automatisch aangemaakt met een PowerShell script
en toegevoegd aan de juiste groepen.

---

## Wat ik heb geleerd

- Hoe Active Directory Domain Services werkt als centraal beheersysteem
- Het verschil tussen een AD rol installeren en een domein aanmaken
- Waarom DNS onmisbaar is voor Active Directory
- Hoe DHCP automatisch IP adressen uitdeelt aan clients
- Hoe je clients joint aan een Windows domein
- Hoe je gebruikers en groepen beheert in Active Directory
