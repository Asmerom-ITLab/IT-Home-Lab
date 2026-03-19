# Home Lab Overzicht

Volledig overzicht van mijn IT Home Lab gebouwd in VMware Workstation.

---

## Doel

Dit home lab is gebouwd om praktische IT vaardigheden te ontwikkelen
die direct toepasbaar zijn in een bedrijfsomgeving als Junior System
Administrator.

---

## Infrastructuur overzicht

```
INTERNET
    |
[VMware NAT — 192.168.100.2]
    |
    +------ [192.168.100.10] Windows Server 2025 — DC01
    |        Active Directory | DNS | DHCP | File Server
    |        Group Policy | Backup
    |
    +------ [192.168.100.20] Ubuntu Server 24.04
    |        Apache | SSH | Zabbix Server
    |
    +------ [192.168.100.12] Windows 10 Client
    |        Domein client — lab.local
    |
    +------ [192.168.100.13] Windows 11 Client
             Domein client — lab.local
```

---

## Machines overzicht

| Machine | OS | IP | Rol |
|---|---|---|---|
| DC01 | Windows Server 2025 | 192.168.100.10 | Domain Controller |
| ubuntu-server | Ubuntu 24.04 LTS | 192.168.100.20 | Linux Server |
| Windows 10 | Windows 10 | 192.168.100.12 | Client |
| Windows 11 | Windows 11 | 192.168.100.13 | Client |

---

## Labs overzicht

| Lab | Beschrijving | Status |
|---|---|---|
| Network Lab | VMware NAT netwerk opzetten | Klaar |
| Active Directory Lab | AD, DNS, DHCP op Windows Server 2025 | Klaar |
| File Server Lab | 5 mappen, 20 gebruikers, NTFS permissions | Klaar |
| Group Policy Lab | Wachtwoordbeleid, bureaubladbeleid, USB blokkeren | Klaar |
| Backup & Restore Lab | Windows Server Backup configureren | Klaar |
| Linux Server Lab | Ubuntu Server met Apache en SSH | Klaar |
| Monitoring Lab | Zabbix monitoring voor alle servers | Klaar |
| PowerShell Scripts | Systeem rapport en inactieve gebruikers | Klaar |

---

## Gebruikers en groepen

| Afdeling | Groep | Aantal gebruikers |
|---|---|---|
| HR | HR-Groep | 4 |
| IT | IT-Groep | 4 |
| Management | Management-Groep | 4 |
| Finance | Finance-Groep | 4 |
| Sales | Sales-Groep | 4 |
| Totaal | | 20 gebruikers |

---

## Technologieen gebruikt

| Categorie | Technologie |
|---|---|
| Hypervisor | VMware Workstation |
| Server OS | Windows Server 2025 |
| Client OS | Windows 10, Windows 11 |
| Linux | Ubuntu Server 24.04 LTS |
| Directory service | Active Directory Domain Services |
| Scripting | PowerShell |
| Web server | Apache2 |
| Remote access | SSH |
| Monitoring | Zabbix 6.4 |
| Database | MySQL |
| Versie beheer | Git / GitHub |

---

## Tijdlijn

| Week | Wat gedaan |
|---|---|
| Week 1 | VMware netwerk, Windows Server, Active Directory |
| Week 2 | DNS, DHCP, domain join clients |
| Week 3 | File Server, gebruikers, groepen, NTFS |
| Week 4 | Group Policy, Backup, Ubuntu Server |
| Week 5 | Zabbix monitoring, PowerShell scripts |

---

## Wat ik heb geleerd

Na het uitvoeren van alle labs kan ik:

- VMware Workstation netwerken configureren
- Windows Server installeren en configureren
- Active Directory opzetten en beheren
- DNS en DHCP configureren
- Group Policy Objects aanmaken en beheren
- File servers opzetten met toegangsbeheer
- Backups maken en bestanden herstellen
- Ubuntu Server installeren en configureren
- Apache webserver beheren
- SSH verbindingen opzetten
- Zabbix monitoring configureren
- PowerShell scripts schrijven voor automatisering
- Git en GitHub gebruiken voor documentatie

---

## Portfolio link

Alle labs zijn gedocumenteerd op GitHub:
github.com/Asmerom-ITLab/IT-Home-Lab
