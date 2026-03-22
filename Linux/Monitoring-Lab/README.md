# Monitoring Lab — Zabbix

Zabbix monitoring opgezet op Ubuntu Server 24.04 LTS.
Windows Server 2025 en Ubuntu Server worden gemonitord
via het Zabbix dashboard.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Zabbix server | Ubuntu Server — 192.168.100.20 |
| Zabbix versie | 6.4 |
| Database | MySQL |
| Gemonitorde servers | DC01 en ubuntu-server |
| Dashboard URL | http://192.168.100.20/zabbix |

---

## Wat ik heb gedaan

- Zabbix repository toegevoegd op Ubuntu Server
- Zabbix server, frontend en agent geinstalleerd
- MySQL database aangemaakt voor Zabbix
- Zabbix geconfigureerd via zabbix_server.conf
- Zabbix web interface geconfigureerd via setup wizard
- DC01 toegevoegd als host in Zabbix
- Ubuntu Server toegevoegd als host in Zabbix
- Zabbix agent geconfigureerd op Ubuntu Server
- Beide servers tonen groen in het dashboard

---

## Gemonitorde servers

| Host | IP | Template | Status |
|---|---|---|---|
| DC01 | 192.168.100.10 | Windows by Zabbix agent | Actief |
| ubuntu-server | 192.168.100.20 | Linux by Zabbix agent | Actief |

---

## Wat Zabbix monitort

- CPU gebruik
- RAM gebruik
- Schijfruimte
- Netwerk verkeer
- Service status
- Systeem uptime

---

## Resultaat

Beide servers zijn succesvol toegevoegd aan Zabbix en tonen
groen in het dashboard. CPU, RAM en schijfgrafieken zijn
beschikbaar voor beide servers.

---

## Vaardigheden

- Zabbix installatie en configuratie
- MySQL database beheer
- Linux service configuratie
- Infrastructure monitoring
- Zabbix agent configuratie
- Server health monitoring
- Dashboard configuratie

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 46-zabbix-install.png | Zabbix installatie voltooid |
| 47-zabbix-webui.png | Zabbix web interface |
| 48-zabbix-dashboard.png | Zabbix dashboard |
| 49-zabbix-hosts.png | Beide hosts groen |
| 50-zabbix-graphs.png | CPU en RAM grafieken |
