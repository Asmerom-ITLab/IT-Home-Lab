# pfSense VLAN Lab

VLANs geconfigureerd in pfSense voor netwerksegmentatie.
Drie afdelingen krijgen elk een eigen netwerksegment met
eigen firewall regels.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Firewall | pfSense |
| VLAN tool | pfSense web interface |
| Netwerk | VMware Workstation |

---

## VLAN overzicht

| VLAN | Naam | Subnet | Gateway | DHCP Range |
|---|---|---|---|---|
| VLAN 10 | IT | 192.168.10.0/24 | 192.168.10.1 | 100-200 |
| VLAN 20 | HR | 192.168.20.0/24 | 192.168.20.1 | 100-200 |
| VLAN 30 | Management | 192.168.30.0/24 | 192.168.30.1 | 100-200 |

---

## Netwerk diagram

```
pfSense Firewall
    |
    +------ VLAN 10 — IT          192.168.10.0/24
    |        Volledige toegang tot alle netwerken
    |
    +------ VLAN 20 — HR          192.168.20.0/24
    |        Internet toegang — geen toegang tot IT
    |
    +------ VLAN 30 — Management  192.168.30.0/24
             Volledige toegang tot alle netwerken
```

---

## Wat ik heb gedaan

- 3 VLANs aangemaakt in pfSense via Interfaces → VLANs
- Elke VLAN gekoppeld als aparte interface
- IP adressen ingesteld per VLAN interface
- DHCP server ingeschakeld per VLAN
- Firewall regels ingesteld per VLAN:
  - IT — volledige toegang
  - HR — internet toegang, geen toegang tot IT segment
  - Management — volledige toegang

---

## Firewall regels per VLAN

| VLAN | Regel | Actie |
|---|---|---|
| IT | IT naar Any | Pass |
| HR | HR naar internet | Pass |
| HR | HR naar IT subnet | Block |
| Management | Management naar Any | Pass |

---

## Waarom VLANs belangrijk zijn

In een bedrijfsomgeving wil je niet dat alle afdelingen
bij elkaars systemen kunnen. VLANs zorgen voor:

- Betere beveiliging per afdeling
- Minder netwerkverkeer
- Makkelijker beheer per segment
- Compliance met security policies

---

## Wat ik heb geleerd

- Hoe VLANs werken in pfSense
- Hoe je netwerken segmenteert per afdeling
- Hoe je DHCP instelt per VLAN segment
- Hoe je firewall regels maakt per VLAN
- Het belang van netwerksegmentatie in bedrijven

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 105-pfsense-vlans.png | VLAN lijst met IT, HR en Management |
| 106-pfsense-interfaces.png | Alle interfaces in pfSense |
| 107-pfsense-dhcp.png | DHCP instellingen per VLAN |
| 108-pfsense-firewall-vlan.png | Firewall regels per VLAN |
