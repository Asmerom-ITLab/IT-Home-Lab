# pfSense Firewall Lab

pfSense 2.7 geinstalleerd als centrale firewall en router voor het lab.
Alle servers en clients zijn achter pfSense geplaatst. VLANs zijn
geconfigureerd voor netwerksegmentatie.

---

## Omgeving

| Interface | IP | Netwerk | Gebruik |
|---|---|---|---|
| WAN em0 | DHCP | VMnet8 NAT | Internet |
| LAN em1 | 192.168.200.1 | VMnet2 | Beheer |
| INTERN em2 | 192.168.50.1 | VMnet3 | Bedrijfsnetwerk |

---

## Geconfigureerde VLANs

| VLAN | Naam | Subnet | Gateway |
|---|---|---|---|
| VLAN 10 | IT | 192.168.10.0/24 | 192.168.10.1 |
| VLAN 20 | HR | 192.168.20.0/24 | 192.168.20.1 |
| VLAN 30 | Management | 192.168.30.0/24 | 192.168.30.1 |

---

## Firewall regels

| Interface | Regel | Actie |
|---|---|---|
| INTERN | INTERN naar Any | Pass |
| WAN | UDP poort 51820 | Pass — WireGuard |
| WireGuard | ICMP Any | Pass |
| IT VLAN | IT naar Any | Pass |
| HR VLAN | HR naar internet | Pass |
| HR VLAN | HR naar IT subnet | Block |
| Management VLAN | Management naar Any | Pass |

---

## NAT configuratie

| Type | Bron | Vertaling |
|---|---|---|
| Hybrid Outbound NAT | 192.168.50.0/24 | WAN interface adres |

---

## Wat ik heb gedaan

- pfSense ISO gedownload en VM aangemaakt
- VMnet2 en VMnet3 aangemaakt in VMware
- pfSense geinstalleerd met drie netwerk adapters
- WAN, LAN en INTERN interfaces geconfigureerd
- DHCP ingesteld op INTERN interface
- NAT Outbound geconfigureerd voor intern netwerk
- Firewall regels aangemaakt per interface
- VLANs aangemaakt — IT, HR en Management
- DHCP per VLAN geconfigureerd
- Firewall regels per VLAN ingesteld
- WireGuard VPN geinstalleerd en geconfigureerd
- pfSense bijgewerkt naar laatste versie

---

## Opgelost probleem

Na herstart van VMware waren alle VMs niet bereikbaar via pfSense.
Oorzaak: VMnet3 host adapter was actief en trad op als gateway.
Oplossing: Host adapter uitgevinkt in Virtual Network Editor.

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Internet via pfSense | Werkt |
| DC01 ping naar pfSense | Werkt |
| Firewall regels actief | Werkt |
| NAT correct geconfigureerd | Werkt |
| VLANs aangemaakt | Werkt |
| WireGuard VPN actief | Werkt |

---

## Wat ik heb geleerd

- Hoe pfSense werkt als firewall en router
- Hoe NAT Outbound geconfigureerd wordt
- Hoe VLANs netwerken segmenteren
- Hoe firewall regels per interface werken
- Het belang van een centrale firewall

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 96-pfsense-vm.png | pfSense VM in VMware |
| 97-pfsense-adapters.png | Drie netwerk adapters |
| 98-pfsense-vmnet2.png | VMnet2 en VMnet3 aangemaakt |
| 99-pfsense-install.png | pfSense installatie |
| 100-pfsense-boot.png | pfSense console menu |
| 101-pfsense-wan-lan.png | Interfaces geconfigureerd |
| 102-pfsense-dashboard.png | pfSense dashboard |
| 103-pfsense-firewall-rules.png | Firewall regels |
| 104-pfsense-client-test.png | Internet werkt via pfSense |
| 105-pfsense-vlans.png | VLANs aangemaakt |
| 106-pfsense-interfaces.png | Alle interfaces |
| 107-pfsense-dhcp.png | DHCP per VLAN |
| 108-pfsense-firewall-vlan.png | Firewall per VLAN |
