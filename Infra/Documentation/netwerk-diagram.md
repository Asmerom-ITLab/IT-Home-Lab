# Netwerk Diagram

Visueel overzicht van de volledige IT Home Lab infrastructuur.
Aangemaakt via draw.io.

---

## Netwerk Diagram

![Netwerk Diagram](D:\IT-Home-Lab\Infra\Documentation/netwerk-diagram.png)

---

## Netwerk overzicht

```
INTERNET
    |
[VMnet8 NAT — WAN]
    |
[pfSense Firewall]
    |-- WAN  em0 — VMnet8 NAT
    |-- LAN  em1 — VMnet2 192.168.200.1
    |-- INTERN em2 — VMnet3 192.168.50.1
    |
[VMnet3 — 192.168.50.0/24]
    |
    +------ DC01        192.168.50.10
    |        AD DS | DNS | DHCP | File Server
    |        GPO | Backup | RDS | Print Server | CA
    |
    +------ DC02        192.168.50.11
    |        Tweede DC | DHCP Failover | DFS Replicatie
    |
    +------ Ubuntu      192.168.50.20
    |        Apache | SSH | Zabbix | WireGuard
    |
    +------ Windows 10  192.168.50.x (DHCP)
    |        Client | Domein gejoined | Chocolatey
    |
    +------ Windows 11  192.168.50.x (DHCP)
             Client | Domein gejoined | Chocolatey
```

---

## IP adres overzicht

| Machine | IP | Rol |
|---|---|---|
| pfSense WAN | DHCP van NAT | Internet gateway |
| pfSense LAN | 192.168.200.1 | Beheer interface |
| pfSense INTERN | 192.168.50.1 | Intern netwerk gateway |
| DC01 | 192.168.50.10 | Primaire Domain Controller |
| DC02 | 192.168.50.11 | Secundaire Domain Controller |
| Ubuntu Server | 192.168.50.20 | Linux server |
| Windows 10 | 192.168.50.x | Client via DHCP |
| Windows 11 | 192.168.50.x | Client via DHCP |
| WireGuard Server | 10.0.0.1 | VPN gateway |
| WireGuard DC01 | 10.0.0.2 | VPN client |
| WireGuard DC02 | 10.0.0.3 | VPN client |
| WireGuard Ubuntu | 10.0.0.4 | VPN client |
| WireGuard Win10 | 10.0.0.5 | VPN client |
| WireGuard Win11 | 10.0.0.6 | VPN client |

---

## VMware netwerken

| VMnet | Type | Subnet | Gebruik |
|---|---|---|---|
| VMnet2 | Host-only | 192.168.200.0/24 | pfSense beheer |
| VMnet3 | Host-only | 192.168.50.0/24 | Intern bedrijfsnetwerk |
| VMnet8 | NAT | Automatisch | Internet verbinding |

---

## Gebruikte tools

- **draw.io** — netwerk diagram
- **VMware Workstation** — virtualisatie
- **GitHub** — documentatie en versiebeheer
