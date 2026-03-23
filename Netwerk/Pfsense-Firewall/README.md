# pfSense Firewall Lab

pfSense open source firewall geinstalleerd en geconfigureerd
als gateway voor het lab.local netwerk.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Firewall | pfSense 2.x |
| WAN | VMnet8 NAT — 192.168.100.x |
| LAN | VMnet2 Host-only — 192.168.200.1 |
| Client | Windows 10 — 192.168.200.10 |
| Hypervisor | VMware Workstation |

---

## Netwerk diagram

```
INTERNET
    |
[VMnet8 NAT]
    |
[pfSense WAN — em0]
[pfSense LAN — em1]
    |
[VMnet2 — 192.168.200.0/24]
    |
[Windows 10 — 192.168.200.10]
```

---

## Wat ik heb gedaan

- pfSense VM aangemaakt in VMware met 2 netwerk adapters
- VMnet2 Host-only netwerk aangemaakt voor LAN segment
- pfSense geinstalleerd via ISO
- WAN interface gekoppeld aan VMnet8 NAT
- LAN interface gekoppeld aan VMnet2
- LAN IP ingesteld op 192.168.200.1
- DHCP server geconfigureerd op LAN
- Setup wizard voltooid via web dashboard
- Hostname en domein ingesteld
- Firewall regels gecontroleerd
- Internet verbinding getest via pfSense gateway

---

## pfSense configuratie

| Instelling | Waarde |
|---|---|
| Hostname | pfSense |
| Domain | lab.local |
| LAN IP | 192.168.200.1 |
| LAN Subnet | 255.255.255.0 |
| DHCP Range | 192.168.200.100 — 192.168.200.200 |
| DNS | 8.8.8.8 |
| Tijdzone | Europe/Amsterdam |

---

## Wat ik heb geleerd

- Hoe pfSense werkt als firewall en router
- Hoe je WAN en LAN interfaces configureert
- Hoe je DHCP instelt op pfSense
- Hoe je firewall regels bekijkt en beheert
- Het belang van netwerksegmentatie in een bedrijfsomgeving
- Hoe je een apart netwerksegment aanmaakt via VMware

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 96-pfsense-vm.png | pfSense VM in VMware lijst |
| 97-pfsense-adapters.png | VM Settings met twee netwerk adapters |
| 98-pfsense-vmnet2.png | Virtual Network Editor met VMnet2 |
| 99-pfsense-install.png | pfSense installatie scherm |
| 100-pfsense-boot.png | pfSense console menu na opstarten |
| 101-pfsense-wan-lan.png | WAN en LAN interfaces geconfigureerd |
| 102-pfsense-dashboard.png | pfSense web dashboard |
| 103-pfsense-firewall-rules.png | Firewall regels op LAN |
| 104-pfsense-client-test.png | Internet test via pfSense gateway |
