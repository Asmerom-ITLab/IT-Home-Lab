# Monitoring Lab — Zabbix

Zabbix 6.4 geinstalleerd op Ubuntu Server als centrale monitoring oplossing.
DC01 en Ubuntu Server worden bewaakt via Zabbix agents. CPU en disk space
alerts zijn geconfigureerd.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Zabbix Server | Ubuntu — 192.168.50.20 |
| Dashboard | http://192.168.50.20/zabbix |
| Gebruikersnaam | Admin |
| Wachtwoord | zabbix |
| Database | MySQL — zabbix/Welkom@123 |

---

## Gemonitorde hosts

| Host | IP | Agent poort | Status |
|---|---|---|---|
| DC01 | 192.168.50.10 | 10050 | Actief |
| ubuntu-server | 192.168.50.20 | 10050 | Actief |

---

## Geconfigureerde alerts

| Alert | Host | Drempelwaarde | Ernst |
|---|---|---|---|
| CPU gebruik hoog | DC01 | meer dan 80% in 5 min | High |
| Schijf bijna vol | DC01 | meer dan 85% gebruikt | Warning |

---

## Wat ik heb gedaan

- Zabbix repository toegevoegd aan Ubuntu
- Zabbix server, frontend en agent geinstalleerd
- MySQL database aangemaakt voor Zabbix
- Zabbix server geconfigureerd met database wachtwoord
- Apache geconfigureerd voor Zabbix dashboard
- Zabbix agent geinstalleerd op DC01
- Beide hosts toegevoegd aan Zabbix monitoring
- CPU en disk space triggers aangemaakt
- CPU stress test uitgevoerd — alert zichtbaar
- Dashboard aangemaakt met grafieken

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Zabbix dashboard bereikbaar | Werkt |
| DC01 monitoring actief | Werkt |
| Ubuntu monitoring actief | Werkt |
| CPU alert bij stress test | Werkt |
| Dashboard grafieken | Werkt |

---

## Wat ik heb geleerd

- Hoe Zabbix werkt als monitoring oplossing
- Hoe je Zabbix installeert op Ubuntu
- Hoe je hosts toevoegt aan Zabbix
- Hoe je triggers aanmaakt voor alerts
- Hoe je een dashboard aanmaakt met grafieken
- Het belang van proactieve monitoring

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 38-zabbix-install.png | Zabbix installatie voltooid |
| 39-zabbix-dashboard.png | Zabbix dashboard — beide hosts groen |
| 40-zabbix-cpu-trigger.png | CPU trigger aangemaakt |
| 41-zabbix-alert.png | CPU alert zichtbaar bij stress test |
| 42-zabbix-grafieken.png | Dashboard met CPU en Memory grafieken |
