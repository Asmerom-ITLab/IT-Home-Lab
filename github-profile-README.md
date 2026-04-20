# Hallo, ik ben Asmerom 👋

Junior System Administrator in opleiding. Ik heb een volledig IT home lab
gebouwd met 25+ praktische labs over Windows Server, Linux, Netwerk en Security.

---

## Vaardigheden

**Windows Server**
- Active Directory, DNS, DHCP
- Group Policy, File Server, Backup
- Remote Desktop Services
- Certificate Authority
- PowerShell automatisering

**Netwerk en Security**
- pfSense Firewall en VLANs
- WireGuard VPN
- Wazuh SIEM
- File Integrity Monitoring
- Brute Force detectie

**Linux**
- Ubuntu Server 24.04
- Apache, SSH, UFW
- Zabbix Monitoring
- RHEL 9

**Tools**
- VMware Workstation
- Git en GitHub
- Chocolatey
- Zabbix
- Wazuh

---

## IT Home Lab

Volledig virtueel bedrijfsnetwerk gebouwd in VMware Workstation:

```
INTERNET
    |
[pfSense Firewall — 192.168.50.1]
    |
    +------ DC01 — Windows Server 2025 — 192.168.50.10
    |        AD DS | DNS | DHCP | File Server | GPO | CA | RDS
    |
    +------ DC02 — Windows Server 2025 — 192.168.50.11
    |        Tweede DC | DHCP Failover | DFS Replicatie
    |
    +------ Ubuntu Server — 192.168.50.20
    |        Apache | SSH | Zabbix Monitoring
    |
    +------ RHEL-WAZUH-01 — 192.168.100.50
    |        Wazuh SIEM | 5 Agents actief
    |
    +------ Windows 10 + Windows 11
             Clients gejoined aan lab.local
```

---

## Labs overzicht

| Categorie | Aantal labs |
|---|---|
| Systeem | 13 labs |
| Netwerk | 5 labs |
| Security | 5 labs |
| Linux | 2 labs |
| Infra | 3 labs |
| **Totaal** | **25+ labs** |

---

## Statistieken

- 25+ hands-on labs
- 195+ screenshots als bewijs
- 5 PowerShell scripts
- 2 Domain Controllers met replicatie
- 5 Wazuh SIEM agents actief
- 1 WireGuard VPN op alle apparaten

---

## Links

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/asmerom-m-aa6709294)
[![GitHub Lab](https://img.shields.io/badge/IT_Home_Lab-181717?style=flat&logo=github&logoColor=white)](https://github.com/Asmerom-ITLab/IT-Home-Lab)

---

## Doel

Op zoek naar een **Junior IT System Engineer** positie waar ik mijn
hands-on kennis van Windows Server, Linux, Netwerk en Security kan
inzetten en verder kan groeien als IT professional.

*Laatste update: april 2026*
