# IT Home Lab Portfolio

Hands-on IT labs uitgevoerd in VMware Workstation op een lokale pc.
Gericht op de vaardigheden die junior system administrators dagelijks
gebruiken in een bedrijfsomgeving.

---

## Infrastructuur

```
INTERNET
    |
[VMware NAT — 192.168.100.2]
    |
    +------ [192.168.100.10] Windows Server 2025 — DC01
    |        Active Directory | DNS | DHCP | File Server | GPO | Backup
    |
    +------ [192.168.100.11] Windows Server 2025 — DC02
    |        Tweede Domain Controller | AD Replicatie
    |
    +------ [192.168.100.20] Ubuntu Server 24.04 LTS
    |        Apache | SSH | Zabbix Monitoring
    |
    +------ [192.168.100.12] Windows 10 — Client 1
    +------ [192.168.100.13] Windows 11 — Client 2
             Beide gejoined aan lab.local
```

---

## Labs

### Lab 1 — Network Lab
VMware Workstation NAT netwerk geconfigureerd voor een volledig
virtueel bedrijfsnetwerk op een lokale pc.

**Vaardigheden:** VMware, NAT netwerk, subnetting, IP adressering, DHCP scope

---

### Lab 2 — Active Directory Lab
Windows Server 2025 ingericht als Domain Controller met Active
Directory, DNS en DHCP. 20 gebruikers en 5 security groepen
aangemaakt. Windows 10 en Windows 11 clients gejoined aan het domein.

**Vaardigheden:** AD DS, DNS, DHCP, Domain Controller, PowerShell

---

### Lab 3 — File Server Lab
File server opgezet met 5 gedeelde mappen per afdeling en NTFS
toegangsrechten ingesteld per security groep.

**Vaardigheden:** SMB shares, NTFS permissions, toegangsbeheer, security groepen

---

### Lab 4 — Group Policy Lab
Vier Group Policy Objects aangemaakt en gekoppeld aan het domein:
wachtwoordbeleid, bureaubladbeleid, USB blokkeren en Windows Update beleid.

**Vaardigheden:** GPO, domain security, policy management, GPMC, registry

---

### Lab 5 — Backup & Restore Lab
Windows Server Backup geconfigureerd. Backup gemaakt van de Shares
map en een bestand succesvol hersteld na verwijdering.

**Vaardigheden:** Disaster recovery, backup strategie, bestand herstel, wbadmin

---

### Lab 6 — Linux Server Lab
Ubuntu Server 24.04 LTS opgezet met Apache webserver, SSH toegang
en Zabbix monitoring agent.

**Vaardigheden:** Linux, Apache, SSH, UFW firewall, Netplan, systemctl

---

### Lab 7 — Monitoring Lab (Zabbix)
Zabbix 6.4 geinstalleerd op Ubuntu Server. Windows Server DC01 en
Ubuntu Server worden gemonitord via het Zabbix dashboard.

**Vaardigheden:** Zabbix, infrastructure monitoring, MySQL, dashboards, agents

---

### Lab 8 — Domain Users Lab
Domein gebruikers getest op Windows 10 en Windows 11 clients.
NTFS permissions gecorrigeerd en gecontroleerd per afdeling.

**Vaardigheden:** Domain login, NTFS permissions, SMB shares, toegangsbeheer

---

### Lab 9 — Windows Update via GPO
Windows Update geconfigureerd via Group Policy voor alle clients.
Updates worden automatisch geinstalleerd om 02:00 's nachts.

**Vaardigheden:** GPO, Windows Update beheer, registry, client configuratie

---

### Lab 10 — Chocolatey Lab
Chocolatey package manager geinstalleerd op Windows Server, Windows 10
en Windows 11. Software automatisch uitgerold via PowerShell.

**Vaardigheden:** Package management, software deployment, automatisering

---

### Lab 11 — Tweede Domain Controller Lab
Tweede Domain Controller DC02 toegevoegd aan lab.local domein voor
redundantie. AD replicatie geconfigureerd en getest tussen DC01 en DC02.

**Vaardigheden:** Domain Controller redundantie, AD replicatie, repadmin, hoge beschikbaarheid

---

### Lab 12 — Windows Security Lab
Microsoft Defender en Windows Firewall geconfigureerd op Windows Server 2025.
Security rapport gegenereerd via PowerShell script.

**Vaardigheden:** Microsoft Defender, Windows Firewall, security event logs, PowerShell

---

### Lab 13 — PowerShell Scripts
Vier automatiseringsscripts geschreven voor dagelijks sysadmin werk.

| Script | Functie |
|---|---|
| systeem-rapport.ps1 | CPU, RAM, schijf en AD rapport genereren |
| inactieve-gebruikers.ps1 | Inactieve AD gebruikers opsporen en uitschakelen |
| wachtwoord-reset.ps1 | AD gebruikerswachtwoorden resetten |
| security-rapport.ps1 | Defender, Firewall en Security events rapporteren |

**Vaardigheden:** PowerShell scripting, automatisering, AD beheer, scheduling

---

### Lab 14 — Scheduled Tasks Lab
PowerShell scripts automatisch laten draaien via Windows Task Scheduler.
Dagelijks systeem rapport en wekelijkse inactieve gebruikers check.

**Vaardigheden:** Task Scheduler, automatisering, PowerShell, taakbeheer

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Primaire DC | Windows Server 2025 — DC01 — 192.168.100.10 |
| Secundaire DC | Windows Server 2025 — DC02 — 192.168.100.11 |
| Linux Server | Ubuntu Server 24.04 LTS — 192.168.100.20 |
| Client 1 | Windows 10 — 192.168.100.12 |
| Client 2 | Windows 11 — 192.168.100.13 |
| Netwerk | VMware NAT — 192.168.100.0/24 |
| Domein | lab.local |
| Gebruikers | 20 gebruikers in 5 afdelingen |

---

## Technologieen

| Categorie | Technologie |
|---|---|
| Virtualisatie | VMware Workstation |
| Directory service | Active Directory Domain Services |
| Server OS | Windows Server 2025 |
| Client OS | Windows 10, Windows 11 |
| Linux | Ubuntu Server 24.04 LTS |
| Web server | Apache2 |
| Remote access | SSH |
| Monitoring | Zabbix 6.4 |
| Security | Microsoft Defender, Windows Firewall |
| Package management | Chocolatey |
| Scripting | PowerShell |
| Versie beheer | Git / GitHub |

---

## Repository structuur

```
IT-Home-Lab/
├── Network-Lab/
│   └── README.md
├── ActiveDirectory-Lab/
│   ├── README.md
│   ├── setup.md
│   ├── commandos.md
│   └── screenshots/
├── FileServer-Lab/
│   ├── README.md
│   ├── setup.md
│   └── screenshots/
├── Group-Policy-Lab/
│   ├── README.md
│   ├── setup.md
│   └── screenshots/
├── Backup-Lab/
│   ├── README.md
│   ├── setup.md
│   └── screenshots/
├── Linux-Server-Lab/
│   ├── README.md
│   ├── setup.md
│   ├── commandos.md
│   └── screenshots/
├── Monitoring-Lab/
│   ├── README.md
│   ├── setup.md
│   └── screenshots/
├── Domain-Users-Lab/
│   ├── README.md
│   ├── commandos.md
│   └── screenshots/
├── Windows-Update-GPO-Lab/
│   ├── README.md
│   ├── setup.md
│   ├── commandos.md
│   └── screenshots/
├── Chocolatey-Lab/
│   ├── README.md
│   ├── setup.md
│   ├── commandos.md
│   └── screenshots/
├── Tweede-DC-Lab/
│   ├── README.md
│   ├── commandos.md
│   └── screenshots/
├── Windows-Security-Lab/
│   ├── README.md
│   ├── setup.md
│   ├── commandos.md
│   └── screenshots/
├── PowerShell-Scripts/
│   ├── README.md
│   ├── systeem-rapport.ps1
│   ├── inactieve-gebruikers.ps1
│   ├── wachtwoord-reset.ps1
│   └── security-rapport.ps1
├── Scheduled-Tasks-Lab/
│   ├── README.md
│   ├── commandos.md
│   └── screenshots/
└── Documentation/
    ├── home-lab-overview.md
    └── network-architecture.md
```

---

## Doel

Dit portfolio is opgebouwd als onderdeel van mijn ontwikkeling
als Junior System Administrator. Alle labs zijn praktisch uitgevoerd
in een lokale VMware omgeving en gedocumenteerd zoals in een echte
IT-afdeling.

---

**Auteur:** Asmerom
**Status:** In ontwikkeling
**Laatste update:** maart 2026
