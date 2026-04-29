# IT Home Lab 

Welkom bij mijn IT Home Lab portfolio! Dit lab is volledig gebouwd in VMware Workstation
op een lokale pc. Alle labs zijn echt uitgevoerd en gedocumenteerd met screenshots als bewijs.

Het doel van dit lab is om de vaardigheden te laten zien die nodig zijn voor een
functie als **Junior IT System Enigneer**.

---

## Netwerk Topologie

```
                        INTERNET
                           |
                    [VMware NAT]
                    192.168.100.2
                           |
                    +------+------+
                    |   pfSense   |
                    |  Firewall   |
                    +------+------+
                           |
          +----------------+----------------+
          |                |                |
    [VMnet2]          [VMnet3]         [VMnet8]
  Beheer LAN       Intern Netwerk       NAT WAN
192.168.200.0/24  192.168.50.0/24
          |                |
          |       +--------+---------+----------+----------+
          |       |        |         |          |          |
          |    [DC01]   [DC02]   [Ubuntu]  [Win10]   [Win11]
          |    .50.10   .50.11    .50.20    DHCP      DHCP
          |
    [RHEL-WAZUH-01]
      192.168.100.50
      Wazuh SIEM

WireGuard VPN Tunnel: 10.0.0.0/24
  pfSense  → 10.0.0.1
  DC01     → 10.0.0.2
  DC02     → 10.0.0.3
  Ubuntu   → 10.0.0.4
  Windows10 → 10.0.0.5
  Windows11 → 10.0.0.6
```
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/2928f90a-3325-4d37-baa0-f4a89c34252d" />

---

## Overzicht van alle machines

| Machine | IP adres | Rol | OS |
|---|---|---|---|
| pfSense | 192.168.50.1 | Firewall en router | pfSense 2.7 |
| DC01 | 192.168.50.10 | Primaire Domain Controller | Windows Server 2025 |
| DC02 | 192.168.50.11 | Secundaire Domain Controller | Windows Server 2025 |
| Ubuntu Server | 192.168.50.20 | Linux server | Ubuntu 24.04 LTS |
| Windows 10 | DHCP | Client | Windows 10 |
| Windows 11 | DHCP | Client | Windows 11 |
| RHEL-WAZUH-01 | 192.168.100.50 | Wazuh SIEM server | RHEL 9 |

---

## Labs overzicht

### Systeem Labs

| Lab | Beschrijving | Status |
|---|---|---|
| Active Directory | AD DS, DNS, DHCP, 20 gebruikers, 5 groepen | Klaar |
| Tweede DC | DC02 gepromoveerd, AD replicatie, DHCP failover | Klaar |
| File Server | SMB shares, NTFS permissions per afdeling | Klaar |
| Group Policy | Wachtwoord, bureaublad, USB, Windows Update GPO | Klaar |
| Backup en Restore | Windows Server Backup, bestand herstel | Klaar |
| Domain Users | Domein login testen, NTFS permissions | Klaar |
| Remote Desktop Services | RDS rol, Session Collection, gebruikers toegang | Klaar |
| Print Server | Virtuele printer, SMB share, GPO uitrollen | Klaar |
| Certificate Authority | Enterprise Root CA, certificaat templates | Klaar |
| PowerShell Scripts | Systeem rapport, inactieve gebruikers, wachtwoord reset | Klaar |
| Scheduled Tasks | Automatische taken via Task Scheduler | Klaar |
| Windows Security | Defender, Firewall, Security rapport | Klaar |
| WSUS | Windows Update beheer via WSUS server | Klaar |

### Netwerk Labs

| Lab | Beschrijving | Status |
|---|---|---|
| Network Lab | VMware NAT, subnetting, IP adressering | Klaar |
| pfSense Firewall | Firewall, NAT, centrale gateway | Klaar |
| pfSense VLANs | IT, HR en Management VLAN segmenten | Klaar |
| WireGuard VPN | VPN tunnel op alle apparaten | Klaar |
| Windows Update GPO | Automatische updates via Group Policy | Klaar |

### Security Labs

| Lab | Beschrijving | Status |
|---|---|---|
| Windows Security | Microsoft Defender, Firewall configuratie | Klaar |
| Wazuh SIEM | SIEM monitoring op RHEL 9, 5 agents | Klaar |
| File Integrity Monitoring | Bestandswijzigingen detecteren via Wazuh | Klaar |
| Brute Force detectie | Aanvallen detecteren via Wazuh | Klaar |
| Security Compliance | CIS benchmark, GDPR, PCI DSS | Klaar |

### Linux Labs

| Lab | Beschrijving | Status |
|---|---|---|
| Linux Server | Ubuntu, Apache, SSH, UFW firewall | Klaar |
| Zabbix Monitoring | Monitoring, CPU en disk alerts, dashboard | Klaar |

### Infra Labs

| Lab | Beschrijving | Status |
|---|---|---|
| Chocolatey | Package management op 3 machines | Klaar |
| Scheduled Tasks | Automatische taken via Task Scheduler | Klaar |
| Wachtwoord Reset | AD wachtwoord reset via PowerShell | Klaar |

---

## Opgeloste problemen

Tijdens het bouwen van dit lab zijn er technische problemen opgelost.
Dit laat zien dat ik problemen kan analyseren en oplossen.

| Probleem | Oorzaak | Oplossing |
|---|---|---|
| DC02 promotie mislukt | Kloon had AD database conflict | Schone Windows Server installatie |
| WSUS SQL timeout | Te weinig RAM voor database | SQL timeout verhoogd naar 7200 seconden |
| Snort niet compatibel | pfSense 2.7 libcrypto conflict | Gedocumenteerd, Wazuh gebruikt als alternatief |
| Ubuntu geen internet | VMware VMnet3 ARP conflict | ARP cache geleegd en route gereset |
| Wazuh dashboard fout | YAML configuratie fout | Configuratie handmatig gecorrigeerd |
| pfSense geen bereik | VMnet3 host adapter actief | VMware host adapter uitgevinkt |

---

## Technologieen

| Categorie | Technologie |
|---|---|
| Virtualisatie | VMware Workstation |
| Directory service | Active Directory Domain Services |
| Server OS | Windows Server 2025 |
| Client OS | Windows 10, Windows 11 |
| Linux | Ubuntu Server 24.04 LTS, RHEL 9 |
| Web server | Apache2 |
| Remote access | SSH, RDP, WireGuard VPN |
| Monitoring | Zabbix 6.4 |
| SIEM | Wazuh 4.7.5 |
| Security | Microsoft Defender, Windows Firewall, pfSense |
| Package management | Chocolatey |
| Scripting | PowerShell |
| Firewall | pfSense 2.7 |
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
│   ├── RDS-Lab/
│   ├── Print-Server-Lab/
│   ├── Certificate-Authority-Lab/
│   ├── PowerShell-Scripts/
│   ├── Scheduled-Tasks-Lab/
│   ├── Windows-Security-Lab/
│   └── WSUS-Lab/
├── Netwerk/
│   ├── Network-Lab/
│   ├── pfSense-Lab/
│   ├── WireGuard-VPN-Lab/
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
└── Documentation/
    ├── netwerk-diagram.png
    ├── bekende-problemen.md
    └── home-lab-overview.md
```

---

## Statistieken

- **** hands-on labs voltooid
- **195+** screenshots als bewijs
- **5** PowerShell automatisering scripts
- **2** Domain Controllers met replicatie en failover
- **3** VLANs geconfigureerd in pfSense
- **5** Wazuh agents actief
- **1** WireGuard VPN tunnel op alle apparaten
- **1** Certificate Authority voor eigen SSL certificaten

---

## Doel

Dit portfolio is gebouwd als onderdeel van mijn ontwikkeling als
**Junior IT System Engineer**. Alle labs zijn echt uitgevoerd
in een lokale VMware omgeving en gedocumenteerd zoals in een echte IT afdeling.

---

**Auteur:** Asmerom Michael
**LinkedIn:**-[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/asmerom-m-aa6709294)
**GitHub:**-[![GitHub Lab](https://img.shields.io/badge/IT_Home_Lab-181717?style=flat&logo=github&logoColor=white)](https://github.com/Asmerom-ITLab/IT-Home-Lab)
**Status:** In ontwikkeling
**Laatste update:** april 2026
