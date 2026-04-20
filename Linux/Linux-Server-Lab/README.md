# Linux Server Lab

Ubuntu Server 24.04 LTS opgezet als Linux server in het lab.local netwerk.
Apache webserver, SSH toegang en UFW firewall zijn geconfigureerd.
Zabbix monitoring agent is geinstalleerd voor centrale monitoring.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | Ubuntu Server 24.04 LTS |
| IP adres | 192.168.50.20 |
| Gebruiker | ubuntu |
| SSH poort | 22 |
| Apache | Poort 80 en 443 |

---

## Wat ik heb gedaan

- Ubuntu Server 24.04 LTS geinstalleerd
- Statisch IP ingesteld via pfSense DHCP reservering
- Apache webserver geinstalleerd en geconfigureerd
- SSH ingeschakeld voor remote beheer
- UFW firewall geconfigureerd
- Zabbix agent geinstalleerd en geconfigureerd
- Wazuh agent geinstalleerd voor security monitoring
- WireGuard VPN geconfigureerd

---

## Firewall regels

| Poort | Protocol | Gebruik |
|---|---|---|
| 22 | TCP | SSH toegang |
| 80 | TCP | Apache HTTP |
| 443 | TCP | Apache HTTPS |
| 10050 | TCP | Zabbix agent |
| 1514 | TCP | Wazuh agent |

---

## Bekende problemen

Ubuntu had verbindingsproblemen via pfSense door een ARP conflict
in VMware VMnet3. Oplossing: VMware host adapter uitgeschakeld voor VMnet3.

---

## Testresultaten

| Test | Resultaat |
|---|---|
| SSH verbinding | Werkt |
| Apache webserver | Werkt |
| UFW firewall | Werkt |
| Zabbix agent actief | Werkt |
| Wazuh agent actief | Werkt |
| WireGuard VPN | Werkt |
| Internet verbinding | Werkt |

---

## Wat ik heb geleerd

- Hoe Ubuntu Server geconfigureerd wordt
- Hoe Apache webserver werkt op Linux
- Hoe SSH remote beheer werkt
- Hoe UFW firewall regels werkt
- Hoe je een Zabbix agent installeert op Linux
- Hoe je netplan configuratie bijwerkt

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 33-ubuntu-install.png | Ubuntu Server installatie |
| 34-apache-actief.png | Apache webserver draait |
| 35-ssh-verbinding.png | SSH verbinding succesvol |
| 36-ufw-status.png | UFW firewall regels |
| 37-zabbix-agent.png | Zabbix agent actief |
