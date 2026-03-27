# DC2 Redundancy Lab — Setup

Volledige stap-voor-stap configuratie van DC02 als redundante server
met DHCP Failover, DFS Replicatie en Windows Server Backup.

---

## Vereisten

- DC01 draait als primaire Domain Controller (`lab.local`)
- DC02 is al gejoined aan `lab.local` als secundaire DC
- AD replicatie tussen DC01 en DC02 werkt correct
- Beide servers hebben netwerkverbinding op `192.168.100.0/24`

---

## Stap 1 — Verifieer AD Replicatie

Voordat je begint, controleer of DC02 correct replicatie uitvoert.

**Op DC01 (PowerShell als Administrator):**

```powershell
# Overzicht van alle Domain Controllers
Get-ADDomainController -Filter * | Select Name, IPv4Address, Site, IsGlobalCatalog

# Controleer replicatie samenvatting
repadmin /replsummary
```

**Op DC02 (PowerShell als Administrator):**

```powershell
# Controleer of AD services draaien
Get-Service adws, kdc, netlogon, dns | Select Name, Status

# Controleer verbinding met DC01
nltest /dsgetdc:lab.local
```

**Verwacht resultaat:**

- Alle services tonen `Running`
- `repadmin /replsummary` toont 0 fouten
- DC02 is zichtbaar in de DC lijst

---

## Stap 2 — DHCP Failover configureren

### 2A — DHCP rol installeren op DC02

Voer uit op **DC01** (PowerShell als Administrator):

```powershell
# Installeer DHCP rol op DC02
Install-WindowsFeature -ComputerName DC02 -Name DHCP -IncludeManagementTools

# Autoriseer DC02 als DHCP server in Active Directory
Add-DhcpServerInDC -DnsName "DC02.lab.local" -IPAddress 192.168.100.11
```

Verwacht resultaat: `Success : True`

### 2B — Controleer bestaande DHCP scope op DC01

```powershell
# Bekijk huidige scope
Get-DhcpServerv4Scope

# Bekijk scope details
Get-DhcpServerv4Scope | Select ScopeId, StartRange, EndRange, SubnetMask, State
```

### 2C — DHCP Failover instellen

```powershell
# Configureer Hot Standby failover (DC01 = actief, DC02 = standby)
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
```

### 2D — Verificatie

```powershell
# Controleer failover configuratie
Get-DhcpServerv4Failover

# Controleer scope op DC02
Get-DhcpServerv4Scope -ComputerName DC02.lab.local
```

**Verwacht resultaat:** `Get-DhcpServerv4Failover` toont `State: Normal`.
DC02 heeft dezelfde scope als DC01 (`192.168.100.0`).

---

## Stap 3 — DFS File Share Replicatie

### 3A — File Server en DFS rollen installeren op DC02

Voer uit op **DC01** (PowerShell als Administrator):

```powershell
# Installeer File Server en DFS rollen op DC02
Install-WindowsFeature -ComputerName DC02 `
  -Name FS-FileServer, FS-DFS-Namespace, FS-DFS-Replication `
  -IncludeManagementTools
```

### 3B — Shares mappen aanmaken op DC02

**RDP naar DC02** en open PowerShell als Administrator:

```powershell
# Maak dezelfde mappenstructuur als DC01
New-Item -Path "C:\Shares" -ItemType Directory -Force
New-Item -Path "C:\Shares\IT" -ItemType Directory -Force
New-Item -Path "C:\Shares\HR" -ItemType Directory -Force
New-Item -Path "C:\Shares\Finance" -ItemType Directory -Force
New-Item -Path "C:\Shares\Management" -ItemType Directory -Force
New-Item -Path "C:\Shares\Algemeen" -ItemType Directory -Force

# Deel de mappen via SMB
New-SmbShare -Name "IT"         -Path "C:\Shares\IT"         -FullAccess "lab\Domain Admins" -ReadAccess "lab\IT"
New-SmbShare -Name "HR"         -Path "C:\Shares\HR"         -FullAccess "lab\Domain Admins" -ReadAccess "lab\HR"
New-SmbShare -Name "Finance"    -Path "C:\Shares\Finance"    -FullAccess "lab\Domain Admins" -ReadAccess "lab\Finance"
New-SmbShare -Name "Management" -Path "C:\Shares\Management" -FullAccess "lab\Domain Admins" -ReadAccess "lab\Management"
New-SmbShare -Name "Algemeen"   -Path "C:\Shares\Algemeen"   -FullAccess "lab\Domain Admins" -ReadAccess "lab\Domain Users"
```

### 3C — DFS Replication Group aanmaken

Terug op **DC01** (PowerShell als Administrator):

```powershell
# Maak Replication Group aan
New-DfsReplicationGroup -GroupName "Shares-Replication"

# Voeg DC01 en DC02 toe als members
Add-DfsrMember -GroupName "Shares-Replication" -ComputerName "DC01"
Add-DfsrMember -GroupName "Shares-Replication" -ComputerName "DC02"

# Maak de gerepliceerde map aan
New-DfsReplicatedFolder -GroupName "Shares-Replication" -FolderName "Shares"

# DC01 = primaire bron (eerste synchronisatie)
Set-DfsrMembership -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -ComputerName "DC01" `
  -ContentPath "C:\Shares" `
  -PrimaryMember $true `
  -Force

# DC02 = secundaire ontvanger
Set-DfsrMembership -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -ComputerName "DC02" `
  -ContentPath "C:\Shares" `
  -PrimaryMember $false `
  -Force

# Maak replicatieverbinding DC01 → DC02
Add-DfsrConnection -GroupName "Shares-Replication" `
  -SourceComputerName "DC01" `
  -DestinationComputerName "DC02"
```

### 3D — DFS Verificatie en Testen

```powershell
# Controleer replication group
Get-DfsReplicationGroup
Get-DfsrMembership -GroupName "Shares-Replication"

# Controleer backlog (moet naar 0 gaan)
Get-DfsrBacklog -SourceComputerName DC01 `
  -DestinationComputerName DC02 `
  -GroupName "Shares-Replication" `
  -FolderName "Shares" `
  -Verbose

# Test de replicatie — maak testbestand aan op DC01
New-Item -Path "C:\Shares\Algemeen\replicatie-test.txt" -ItemType File -Value "DFS replicatie werkt!"

# Wacht 10 seconden en controleer of het op DC02 staat
Start-Sleep -Seconds 10
Invoke-Command -ComputerName DC02 -ScriptBlock {
  Get-Item "C:\Shares\Algemeen\replicatie-test.txt"
}
```

**Verwacht resultaat:** Bestand verschijnt automatisch op DC02.

---

## Stap 4 — Windows Server Backup op DC02

### Installatie en Backup Policy configureren

**Op DC02** (PowerShell als Administrator):

```powershell
# Installeer Windows Server Backup
Install-WindowsFeature -Name Windows-Server-Backup -IncludeManagementTools

# Maak backup map aan
New-Item -Path "C:\Backup" -ItemType Directory -Force

# Maak nieuwe backup policy
$policy = New-WBPolicy

# Voeg C:\Shares toe als backup bron
$fileSpec = New-WBFileSpec -FileSpec "C:\Shares"
Add-WBFileSpec -Policy $policy -FileSpec $fileSpec

# Stel backup bestemming in (lokale schijf C:\)
$backupLocation = New-WBBackupTarget -VolumePath "C:\"
Add-WBBackupTarget -Policy $policy -Target $backupLocation

# Dagelijks schema om 02:00
Set-WBSchedule -Policy $policy -Schedule 02:00

# VSS volledige backup inschakelen
Set-WBVssBackupOptions -Policy $policy -VssCopyBackup

# Sla de policy op
Set-WBPolicy -Policy $policy -Force
```

### Handmatige testbackup uitvoeren

```powershell
# Voer direct een backup uit om te testen
Start-WBBackup -Policy (Get-WBPolicy)

# Controleer backup resultaat
Get-WBSummary
```

**Verwacht resultaat:** `Get-WBSummary` toont laatste succesvolle backup
met `LastBackupResultHR : 0x00000000` (geen fouten).

---

## Eindresultaat

| Scenario | Resultaat |
| --- | --- |
| DC01 DHCP uitgevallen | DC02 neemt DHCP automatisch over binnen 1 minuut |
| Bestand toegevoegd op DC01 | Bestand verschijnt binnen seconden op DC02 |
| DC01 niet bereikbaar | File Shares toegankelijk via DC02 |
| Dagelijkse backup | DC02 maakt elke nacht om 02:00 een backup van Shares |
