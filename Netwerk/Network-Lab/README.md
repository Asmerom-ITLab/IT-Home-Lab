# Network Lab

VMware Workstation netwerk geconfigureerd voor een volledig virtueel
bedrijfsnetwerk. Alle machines communiceren via pfSense als centrale gateway.

---

## Omgeving

| Netwerk | Type | Subnet | Gebruik |
|---|---|---|---|
| VMnet2 | Host-only | 192.168.200.0/24 | pfSense beheer |
| VMnet3 | Host-only | 192.168.50.0/24 | Intern bedrijfsnetwerk |
| VMnet8 | NAT | Automatisch | Internet verbinding |

---

## Netwerk topologie

```
INTERNET
    |
[VMnet8 NAT — 192.168.100.2]
    |
[pfSense Firewall]
    |-- WAN  em0 — VMnet8
    |-- LAN  em1 — VMnet2 — 192.168.200.1
    |-- INTERN em2 — VMnet3 — 192.168.50.1
    |
[VMnet3 — 192.168.50.0/24]
    |
    +-- DC01     192.168.50.10
    +-- DC02     192.168.50.11
    +-- Ubuntu   192.168.50.20
    +-- Win10    DHCP
    +-- Win11    DHCP
```

---

## Wat ik heb gedaan

- VMware Workstation geinstalleerd op lokale pc
- VMnet2 aangemaakt als Host-only netwerk voor beheer
- VMnet3 aangemaakt als Host-only netwerk voor intern gebruik
- VMnet8 NAT geconfigureerd voor internet verbinding
- pfSense VM aangemaakt met drie netwerk adapters
- Alle VMs gekoppeld aan VMnet3
- Statische IP adressen ingesteld op servers
- DHCP ingesteld voor Windows clients via pfSense

---

## IP adres overzicht

| Machine | IP adres | Gateway | DNS |
|---|---|---|---|
| pfSense INTERN | 192.168.50.1 | — | — |
| DC01 | 192.168.50.10 | 192.168.50.1 | 192.168.50.10 |
| DC02 | 192.168.50.11 | 192.168.50.1 | 192.168.50.10 |
| Ubuntu | 192.168.50.20 | 192.168.50.1 | 192.168.50.10 |
| Windows 10 | DHCP | 192.168.50.1 | 192.168.50.10 |
| Windows 11 | DHCP | 192.168.50.1 | 192.168.50.10 |
| RHEL Wazuh | 192.168.100.50 | 192.168.100.2 | 8.8.8.8 |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| DC01 ping naar pfSense | Werkt |
| DC01 ping naar DC02 | Werkt |
| DC01 internet | Werkt |
| Windows 10 DHCP | Werkt |
| Windows 10 internet | Werkt |

---

## Wat ik heb geleerd

- Hoe VMware virtuele netwerken werken
- Hoe NAT werkt voor internet verbinding
- Hoe Host-only netwerken werken voor isolatie
- Hoe je statische IP adressen instelt
- Hoe subnetting werkt in een bedrijfsnetwerk

---

## Screenshots

![Network Editor](../screenshots-archief/00-network-editor.png)
![VMnet8 Configuratie](../screenshots-archief/01-vmnet8-config.png)
![VM Adapter](../screenshots-archief/02-vm-adapter.png)
![IP Test](../screenshots-archief/03-ip-test.png)
![Static IP](../screenshots-archief/04-static-ip.png)
![DNS Test](../screenshots-archief/05-dns-test.png)
![Win11 Ipconfig](../screenshots-archief/32-win11-ipconfig.png)
![Win11 Ping](../screenshots-archief/33-win11-ping.png)
![Win11 DNS](../screenshots-archief/34-win11-dns.png)

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 00-network-editor.png | VMware Virtual Network Editor |
| 01-vmnet3-config.png | VMnet3 Host-only instellingen |
| 02-pfsense-interfaces.png | pfSense interfaces geconfigureerd |
| 03-ip-overzicht.png | IP adressen op alle machines |
