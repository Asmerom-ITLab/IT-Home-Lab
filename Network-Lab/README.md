# Network Lab

VMware Workstation netwerk geconfigureerd met NAT voor een
volledig virtueel bedrijfsnetwerk op een lokale pc.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Netwerk type | NAT — VMnet8 |
| Subnet | 192.168.100.0/24 |
| Gateway | 192.168.100.2 |
| DNS | 192.168.100.10 |

---

## Netwerk architectuur

```
INTERNET
    |
[VMware NAT — 192.168.100.2]
    |
    +------ [192.168.100.10] Windows Server 2025 — DC01
    |        Active Directory | DNS | DHCP
    |
    +------ [192.168.100.20] Ubuntu Server 24.04
    |        Apache | SSH | Zabbix
    |
    +------ [192.168.100.12] Windows 10 Client
    |        Domein client
    |
    +------ [192.168.100.13] Windows 11 Client
             Domein client
```

---

## Wat ik heb gedaan

- VMware Virtual Network Editor geopend
- VMnet8 geconfigureerd als NAT netwerk
- Subnet ingesteld op 192.168.100.0/24
- DHCP scope geconfigureerd
- Alle VMs gekoppeld aan VMnet8
- Statisch IP ingesteld op Windows Server en Ubuntu
- Connectiviteit getest tussen alle VMs
- Internet toegang gecontroleerd via NAT

---

## IP adressen overzicht

| Machine | IP adres | Type |
|---|---|---|
| Gateway | 192.168.100.2 | VMware NAT |
| Windows Server DC01 | 192.168.100.10 | Statisch |
| Ubuntu Server | 192.168.100.20 | Statisch |
| Windows 10 Client | 192.168.100.12 | DHCP |
| Windows 11 Client | 192.168.100.13 | DHCP |

---

## Resultaat

Alle vier de VMs communiceren met elkaar en hebben
internettoegang via VMware NAT. DHCP deelt automatisch
IP adressen uit aan clients.

---

## Vaardigheden

- VMware Workstation netwerk configuratie
- NAT netwerk opzetten
- Subnetting en IP adressering
- DHCP configuratie
- Netwerk troubleshooting
- Connectiviteit testen

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 00-network-editor.png | VMware Virtual Network Editor |
| 01-vmnet8-config.png | VMnet8 NAT instellingen |
| 02-vm-adapter.png | VM gekoppeld aan VMnet8 |
| 03-ip-test.png | Ping test tussen VMs |
| 04-static-ip.png | Statisch IP op server |
