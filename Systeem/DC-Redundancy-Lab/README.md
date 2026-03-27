# DC2 Redundancy Lab

Tweede Domain Controller (DC02) volledig geconfigureerd met DHCP Failover,
DFS File Share Replicatie en Windows Server Backup voor volledige redundancy.
Als DC01 uitvalt, neemt DC02 automatisch alle taken over.

---

## Doel

Een productie-waardige redundante omgeving bouwen waarbij DC02 als volwaardige
standby server functioneert voor DHCP, File Shares en Backup.

---

## Infrastructuur

```
[DC01 — 192.168.100.10]          [DC02 — 192.168.100.11]
 Active Directory (Primary)   ←→   Active Directory (Secondary)
 DHCP (Active)                ←→   DHCP (Standby / Failover)
 File Shares C:\Shares         ←→   File Shares C:\Shares
 DFS Replication (Source)      →    DFS Replication (Target)
 Windows Server Backup              Windows Server Backup
```

---

## Wat is geconfigureerd

| Onderdeel | DC01 | DC02 |
| --- | --- | --- |
| Active Directory | Primary DC | Secondary DC |
| DNS | Primair | Secundair |
| DHCP | Active (Hot Standby) | Standby (Failover) |
| File Shares | Bron (5 shares) | Replica (DFS) |
| DFS Replicatie | Source member | Destination member |
| Windows Backup | Geconfigureerd | Geconfigureerd |

---

## Labs

### Stap 1 — AD Replicatie verificatie

DC02 gejoined aan lab.local domein en AD replicatie geverifieerd
tussen DC01 en DC02.

**Vaardigheden:** Active Directory, repadmin, nltest, Domain Controller promotie

---

### Stap 2 — DHCP Failover

DHCP Hot Standby failover geconfigureerd. DC01 is de actieve DHCP server,
DC02 neemt automatisch over als DC01 niet beschikbaar is.

**Vaardigheden:** DHCP Failover, Hot Standby, PowerShell, scope replicatie

---

### Stap 3 — DFS File Share Replicatie

DFS Replication Group aangemaakt voor C:\Shares. Bestanden worden
automatisch gesynchroniseerd tussen DC01 en DC02 in real-time.

**Vaardigheden:** DFS-R, SMB Shares, NTFS permissions, replicatie

---

### Stap 4 — Backup op DC02

Windows Server Backup geconfigureerd op DC02. Dagelijkse backup van
C:\Shares om 02:00. Herstel mogelijk onafhankelijk van DC01.

**Vaardigheden:** Windows Server Backup, VSS, disaster recovery, scheduling

---

## Omgeving

| Onderdeel | Details |
| --- | --- |
| Hypervisor | VMware Workstation |
| DC01 OS | Windows Server 2025 |
| DC02 OS | Windows Server 2025 |
| Netwerk | VMware NAT — 192.168.100.0/24 |
| Domein | lab.local |
| DC01 IP | 192.168.100.10 |
| DC02 IP | 192.168.100.11 |

---

## Resultaat

Als DC01 uitvalt:

- DHCP wordt automatisch overgenomen door DC02 (binnen 1 minuut)
- File Shares zijn beschikbaar via DC02 met identieke inhoud
- Backup loopt door op DC02 onafhankelijk van DC01

---

## Screenshots

| Screenshot | Wat je ziet |
| --- | --- |
| `dhcp-failover-scope.png` | DHCP Failover scope zichtbaar op DC02 |
| `dfs-replication-group.png` | DFS Replication Group status actief |
| `dfs-backlog-zero.png` | DFS Backlog staat op 0 (volledig gesynchroniseerd) |
| `backup-policy-dc2.png` | Windows Server Backup schedule geconfigureerd |

---

## Repository structuur

```
DC2-Redundancy-Lab/
├── README.md
├── setup.md
├── commandos.md
└── screenshots/
    ├── dhcp-failover-scope.png
    ├── dfs-replication-group.png
    ├── dfs-backlog-zero.png
    └── backup-policy-dc2.png
```

---

**Auteur:** Asmerom-ITLab
**Status:** Compleet
**Laatste update:** maart 2026
