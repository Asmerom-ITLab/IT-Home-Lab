# pfSense Netwerk Koppeling Lab

Alle servers en clients gekoppeld achter pfSense firewall
via een intern bedrijfsnetwerk op 192.168.50.0/24.

---

## Netwerk diagram

```
INTERNET
    |
[VMnet8 NAT — WAN]
    |
[pfSense Firewall]
    |
    +------ [VMnet2 — 192.168.200.1] Beheer interface
    |
    +------ [VMnet3 — 192.168.50.0/24] Intern bedrijfsnetwerk
                |
                +------ DC01        192.168.50.10
                +------ DC02        192.168.50.11
                +------ Ubuntu      192.168.50.20
                +------ Windows 10  192.168.50.x (DHCP)
                +------ Windows 11  192.168.50.x (DHCP)
```

---

## Omgeving

| Machine | IP | Rol |
|---|---|---|
| pfSense WAN | DHCP van NAT | Internet gateway |
| pfSense LAN | 192.168.200.1 | Beheer interface |
| pfSense INTERN | 192.168.50.1 | Intern bedrijfsnetwerk |
| DC01 | 192.168.50.10 | Primaire Domain Controller |
| DC02 | 192.168.50.11 | Secundaire Domain Controller |
| Ubuntu Server | 192.168.50.20 | Linux server |
| Windows 10 | 192.168.50.x | Client via DHCP |
| Windows 11 | 192.168.50.x | Client via DHCP |

---

## Wat ik heb gedaan

- VMnet3 Host-only netwerk aangemaakt — 192.168.50.0/24
- Derde netwerk adapter toegevoegd aan pfSense VM
- INTERN interface geconfigureerd in pfSense — 192.168.50.1/24
- DHCP server ingeschakeld op INTERN interface
- NAT Outbound regel toegevoegd voor intern netwerk
- Firewall regel toegevoegd — INTERN naar Any Pass
- Alle VMs verplaatst naar VMnet3
- Statische IP adressen ingesteld op DC01, DC02 en Ubuntu
- Windows 10 en Windows 11 via DHCP
- Internet verbinding getest op alle machines

---

## pfSense configuratie

| Interface | IP | Netwerk | DHCP |
|---|---|---|---|
| WAN em0 | DHCP | VMnet8 NAT | Automatisch |
| LAN em1 | 192.168.200.1/24 | VMnet2 | Uit |
| INTERN em2 | 192.168.50.1/24 | VMnet3 | 192.168.50.100-200 |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| DC01 ping naar pfSense | Werkt |
| DC01 ping naar DC02 | Werkt |
| DC01 ping naar Ubuntu | Werkt |
| DC01 internet | Werkt |
| DC02 internet | Werkt |
| Ubuntu internet | Werkt |
| Windows 10 DHCP en internet | Werkt |
| Windows 11 DHCP en internet | Werkt |

---

## Wat ik heb geleerd

- Hoe je meerdere netwerken koppelt via pfSense
- Hoe NAT Outbound werkt voor intern verkeer
- Hoe je DHCP configureert per interface in pfSense
- Hoe je firewall regels maakt voor intern netwerk
- Het belang van een centrale firewall in een bedrijfsnetwerk

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| vmnet3-config.png | VMware Virtual Network Editor met VMnet3 |
| pfsense-em2.png | pfSense INTERN interface 192.168.50.1 |
| pfsense-nat.png | NAT Outbound regel voor intern netwerk |
| firewall-intern.png | Firewall regel voor INTERN netwerk |
| alle-vms-verbonden.png | Ping test van alle VMs succesvol |
| internet-test.png | Internet werkt op alle machines |
