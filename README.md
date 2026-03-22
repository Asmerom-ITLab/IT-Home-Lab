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

## Systeem Labs

| Lab | Status | Beschrijving |
|---|---|---|
| ActiveDirectory-Lab | ✅ Klaar | AD DS, DNS, DHCP, 20 gebruikers, 5 groepen |
| Tweede-DC-Lab | ✅ Klaar | Tweede Domain Controller, AD replicatie |
| FileServer-Lab | ✅ Klaar | SMB shares, NTFS permissions per afdeling |
| Group-Policy-Lab | ✅ Klaar | GPO wachtwoord, bureaublad, USB blokkeren |
| Backup-Lab | ✅ Klaar | Windows Server Backup, bestand herstel |
| Domain-Users-Lab | ✅ Klaar | Domein login testen, NTFS permissions |
| PowerShell-Scripts | ✅ Klaar | Systeem rapport, inactieve gebruikers, wachtwoord reset |

---

## Netwerk Labs

| Lab | Status | Beschrijving |
|---|---|---|
| Network-Lab | ✅ Klaar | VMware NAT, subnetting, IP adressering |
| Windows-Update-GPO-Lab | ✅ Klaar | Windows Update via Group Policy |
| pfSense-Lab | 📋 Gepland | Firewall configuratie |
| WireGuard-VPN | 📋 Gepland | VPN server opzetten |

---

## Security Labs

| Lab | Status | Beschrijving |
|---|---|---|
| Windows-Security-Lab | ✅ Klaar | Defender, Firewall, Security rapport |
| Wazuh-SIEM-Lab | 🔄 Bezig | SIEM monitoring, security alerts |

---

## Linux Labs

| Lab | Status | Beschrijving |
|---|---|---|
| Linux-Server-Lab | ✅ Klaar | Ubuntu, Apache, SSH, UFW firewall |
| Monitoring-Lab | ✅ Klaar | Zabbix monitoring, dashboards, agents |

---

## Infra Labs

| Lab | Status | Beschrijving |
|---|---|---|
| Chocolatey-Lab | ✅ Klaar | Package management, software deployment |
| Scheduled-Tasks-Lab | ✅ Klaar | Automatische taken via Task Scheduler |
| Wachtwoord-Reset-Script | ✅ Klaar | AD wachtwoord reset via PowerShell |

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
├── Systeem/
│   ├── ActiveDirectory-Lab/
│   ├── Tweede-DC-Lab/
│   ├── FileServer-Lab/
│   ├── Group-Policy-Lab/
│   ├── Backup-Lab/
│   ├── Domain-Users-Lab/
│   └── PowerShell-Scripts/
├── Netwerk/
│   ├── Network-Lab/
│   └── Windows-Update-GPO-Lab/
├── Security/
│   ├── Windows-Security-Lab/
│   └── Wazuh-SIEM-Lab/
├── Linux/
│   ├── Linux-Server-Lab/
│   └── Monitoring-Lab/
├── Infra/
│   ├── Chocolatey-Lab/
│   ├── Scheduled-Tasks-Lab/
│   └── Wachtwoord-Reset-Script/
└── README.md
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
