# Zabbix Monitoring 

Zabbix geconfigureerd met concrete alerts en grafieken voor
DC01. CPU en disk space worden bewaakt met automatische
meldingen bij problemen.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Zabbix Server | Ubuntu 192.168.50.20 |
| Zabbix dashboard | http://192.168.50.20/zabbix |
| Gemonitorde hosts | DC01, Ubuntu Server |

---

## Wat ik heb gedaan

- CPU alert ingesteld op DC01 — melding bij meer dan 80%
- Disk space alert ingesteld op DC01 — melding bij meer dan 85%
- CPU stress test uitgevoerd — alert verschijnt in dashboard
- Dashboard aangepast met CPU en Memory grafieken
- Zabbix agent gecontroleerd op DC01

---

## Geconfigureerde triggers

| Trigger | Host | Drempelwaarde | Ernst |
|---|---|---|---|
| CPU gebruik hoog | DC01 | meer dan 80% gedurende 5 min | High |
| Schijf bijna vol | DC01 | meer dan 85% gebruikt | Warning |

---

## Dashboard widgets

| Widget | Inhoud |
|---|---|
| CPU gebruik | DC01 CPU utilization grafiek |
| Memory gebruik | DC01 Memory utilization grafiek |
| Problems | Actieve alerts overzicht |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| CPU stress test uitgevoerd | Alert zichtbaar in Problems |
| Alert verdwijnt na stress test | Automatisch opgelost |
| Dashboard grafieken | CPU en Memory zichtbaar |
| Zabbix agent DC01 | Running |

---

## Wat ik heb geleerd

- Hoe je triggers aanmaakt in Zabbix
- Hoe je drempelwaarden instelt voor alerts
- Hoe je een CPU stress test uitvoert via PowerShell
- Hoe je een dashboard aanpast met grafieken
- Het belang van proactieve monitoring in IT

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| zabbix-cpu-trigger.png | CPU trigger aangemaakt in Zabbix |
| zabbix-disk-trigger.png | Disk trigger aangemaakt in Zabbix |
| zabbix-alert-actief.png | CPU alert zichtbaar in Problems |
| zabbix-dashboard.png | Dashboard met CPU en Memory grafieken |



```



