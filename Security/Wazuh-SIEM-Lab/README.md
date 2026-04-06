# Wazuh SIEM Lab

Wazuh SIEM geinstalleerd op Red Hat Enterprise Linux 9.
Alle servers en clients worden gemonitord via Wazuh agents.
Security events en alerts worden centraal verzameld en geanalyseerd.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Wazuh Server | RHEL 9 — 192.168.100.50 |
| Dashboard | https://192.168.100.50 |
| Agents | DC01, DC02, Ubuntu, Windows 10, Windows 11 |

---

## Netwerk diagram

```
RHEL-WAZUH-01 (192.168.100.50)
    |
    | Wazuh Manager poort 1514/1515
    |
    +------ DC01        192.168.50.10  — Wazuh Agent
    +------ DC02        192.168.50.11  — Wazuh Agent
    +------ Ubuntu      192.168.50.20  — Wazuh Agent
    +------ Windows 10  192.168.50.x   — Wazuh Agent
    +------ Windows 11  192.168.50.x   — Wazuh Agent
```

---

## Wat ik heb gedaan

- Red Hat Enterprise Linux 9 VM aangemaakt
- Gratis Red Hat Developer account aangemaakt
- RHEL geregistreerd via subscription-manager
- Systeem volledig geüpdatet via dnf
- Wazuh repository toegevoegd
- Wazuh all-in-one installatie uitgevoerd
- Firewall poorten geopend op RHEL
- Wazuh dashboard geconfigureerd
- Wazuh agent geinstalleerd op alle 5 machines
- Security alerts gecontroleerd
- CPU stress test uitgevoerd voor alert generatie

---

## Wazuh configuratie

| Instelling | Waarde |
|---|---|
| Wazuh versie | 4.7.5 |
| OS | Red Hat Enterprise Linux 9 |
| Dashboard URL | https://192.168.100.50 |
| Manager poort | 1514 TCP |
| Registratie poort | 1515 TCP |
| API poort | 55000 TCP |
| Indexer poort | 9200 TCP |

---

## Geinstalleerde agents

| Agent | Hostname | IP | OS | Status |
|---|---|---|---|---|
| 001 | DC01 | 192.168.50.10 | Windows Server 2025 | Active |
| 002 | DC02 | 192.168.50.11 | Windows Server 2025 | Active |
| 003 | ubuntu-server | 192.168.50.20 | Ubuntu 24.04 | Active |
| 004 | Windows10 | 192.168.50.x | Windows 10 | Active |
| 005 | Windows11 | 192.168.50.x | Windows 11 | Active |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Wazuh installatie op RHEL | Succesvol |
| Dashboard bereikbaar | Werkt |
| Alle 5 agents actief | Werkt |
| Security events zichtbaar | Werkt |
| CPU stress test alert | Werkt |

---

## Wat ik heb geleerd

- Hoe Wazuh SIEM werkt als centrale security monitor
- Hoe je Wazuh installeert op RHEL 9
- Hoe je agents installeert op Windows en Linux
- Hoe je security events analyseert
- Het belang van SIEM in een bedrijfsomgeving
- Hoe je Red Hat Enterprise Linux registreert

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 164-rhel-vm.png | RHEL VM aangemaakt in VMware |
| 165-rhel-ip.png | Statisch IP 192.168.100.50 |
| 166-rhel-subscription.png | subscription-manager geregistreerd |
| 167-rhel-update.png | dnf update voltooid |
| 168-wazuh-repo.png | Wazuh repository toegevoegd |
| 169-wazuh-install.png | Wazuh installatie bezig |
| 170-wazuh-credentials.png | Admin wachtwoord zichtbaar |
| 171-wazuh-dashboard.png | Wazuh login pagina |
| 172-wazuh-home.png | Wazuh dashboard na inloggen |
| 173-wazuh-agents.png | Agents pagina |
| 174-wazuh-agent-dc01.png | Agent actief op DC01 |
| 175-wazuh-agent-ubuntu.png | Agent actief op Ubuntu |
| 176-wazuh-agent-dc02.png | Agent actief op DC02 |
| 177-wazuh-agent-win10.png | Agent actief op Windows 10 |
| 178-wazuh-agent-win11.png | Agent actief op Windows 11 |
| 179-wazuh-alle-agents.png | Alle 5 agents groen in dashboard |
| 180-wazuh-alerts.png | Security alerts zichtbaar |
| 181-wazuh-security-events.png | Security events van DC01 |
| 182-wazuh-cpu-alert.png | CPU stress test alert |
