# IT Home Lab Portfolio

Hands-on IT labs uitgevoerd in VMware Workstation op een lokale pc.
Gericht op de vaardigheden die junior system engineer dagelijks
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
    +------ [192.168.100.20] Ubuntu Server 24.04 LTS
    |        Apache | SSH | Zabbix Monitoring
    |
    +------ [192.168.100.12] Windows 10 — Client 1
    +------ [192.168.100.13] Windows 11 — Client 2
             Beide gejoined aan lab.local
```

---

## Labs

### Network Lab
VMware Workstation NAT netwerk geconfigureerd voor een volledig
virtueel bedrijfsnetwerk op een lokale pc.

**Vaardigheden:** VMware, NAT netwerk, subnetting, IP adressering

---

### Active Directory Lab
Windows Server 2025 ingericht als Domain Controller met Active
Directory, DNS en DHCP. 20 gebruikers en 5 security groepen
aangemaakt. Windows 10 en Windows 11 clients gejoined aan het domein.

**Vaardigheden:** AD DS, DNS, DHCP, Domain Controller, PowerShell

---

### File Server Lab
File server opgezet met 5 gedeelde mappen per afdeling en NTFS
toegangsrechten ingesteld per security groep.

**Vaardigheden:** SMB shares, NTFS permissions, toegangsbeheer

---

### Group Policy Lab
Drie Group Policy Objects aangemaakt en gekoppeld aan het domein:
wachtwoordbeleid, bureaubladbeleid en USB blokkeren.

**Vaardigheden:** GPO, domain security, policy management, GPMC

---

### Backup & Restore Lab
Windows Server Backup geconfigureerd. Backup gemaakt van de Shares
map en een bestand succesvol hersteld na verwijdering.

**Vaardigheden:** Disaster recovery, backup strategie, bestand herstel

---

### Linux Server Lab
Ubuntu Server 24.04 LTS opgezet met Apache webserver, SSH toegang
en Zabbix monitoring agent.

**Vaardigheden:** Linux, Apache, SSH, UFW firewall, Netplan

---

### Monitoring Lab
Zabbix 6.4 geinstalleerd op Ubuntu Server. Windows Server en Ubuntu
Server worden gemonitord via het Zabbix dashboard.

**Vaardigheden:** Zabbix, infrastructure monitoring, MySQL, dashboards

---

### PowerShell Scripts
Twee automatiseringsscripts geschreven voor dagelijks sysadmin werk.

| Script | Functie |
|---|---|
| systeem-rapport.ps1 | CPU, RAM, schijf en AD rapport genereren |
| inactieve-gebruikers.ps1 | Inactieve AD gebruikers opsporen en uitschakelen |

**Vaardigheden:** PowerShell scripting, automatisering, AD beheer

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Server OS | Windows Server 2025 |
| Client OS | Windows 10 en Windows 11 |
| Linux | Ubuntu Server 24.04 LTS |
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
├── PowerShell-Scripts/
│   ├── README.md
│   ├── systeem-rapport.ps1
│   └── inactieve-gebruikers.ps1
└── Documentation/
    ├── home-lab-overview.md
    └── network-architecture.md
```

---

## Doel

Dit portfolio is opgebouwd als onderdeel van mijn ontwikkeling
als Junior System engineer. Alle labs zijn praktisch uitgevoerd
in een lokale VMware omgeving en gedocumenteerd zoals in een echte
IT-afdeling.

---

**Auteur:** Asmerom
**Status:** Compleet
**Laatste update:** maart 2026
