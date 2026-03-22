# Linux Server Lab

Ubuntu Server 24.04 LTS opgezet als Linux server met Apache webserver,
SSH toegang en Zabbix monitoring in een VMware Workstation omgeving.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Server OS | Ubuntu Server 24.04 LTS |
| Server naam | ubuntu-server |
| IP adres | 192.168.100.20 |
| Netwerk | VMware NAT — 192.168.100.0/24 |
| Gebruiker | admin |

---

## Wat ik heb gedaan

- Ubuntu Server 24.04 LTS VM aangemaakt in VMware
- Systeem geupdate met apt update en apt upgrade
- Statisch IP ingesteld op 192.168.100.20
- Hostname ingesteld op ubuntu-server
- SSH server geinstalleerd en geconfigureerd
- Apache webserver geinstalleerd en getest
- UFW firewall geconfigureerd
- SSH verbinding getest vanuit Windows 10
- Zabbix agent geinstalleerd en geconfigureerd
- Server toegevoegd aan Zabbix monitoring dashboard

---

## Resultaat

Na deze lab is de volgende infrastructuur operationeel:

- Ubuntu Server op 192.168.100.20
- SSH toegang via poort 22
- Apache webserver bereikbaar via http://192.168.100.20
- UFW firewall actief met SSH en Apache regels
- Zabbix agent actief — server wordt gemonitord

---

## Vaardigheden

- Linux server installatie en configuratie
- SSH configuratie en beheer
- Apache webserver installatie
- UFW firewall beheer
- Zabbix agent configuratie
- Linux commando's en bestandssysteem
- Netwerk configuratie via Netplan
- VMware VM configuratie

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 26-ubuntu-install.png | Ubuntu installatie scherm |
| 27-ubuntu-login.png | Eerste login op Ubuntu |
| 28-ubuntu-static-ip.png | Statisch IP ingesteld |
| 29-apache-status.png | Apache actief |
| 30-apache-browser.png | Apache pagina in browser |
| 31-ssh-verbinding.png | SSH verbinding vanuit Windows |
| 32-ufw-status.png | Firewall status |
| 33-zabbix-agent.png | Zabbix agent actief |
