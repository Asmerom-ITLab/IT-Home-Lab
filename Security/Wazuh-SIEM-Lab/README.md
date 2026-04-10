# Wazuh SIEM Lab

Wazuh SIEM geinstalleerd op RHEL 9 als centrale security monitoring
oplossing voor het lab.local netwerk. Alle servers en clients worden
bewaakt via Wazuh agents.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Wazuh Server | RHEL 9 — RHEL-WAZUH-01 — 192.168.100.50 |
| Dashboard | https://192.168.100.50 |
| Agents | DC01, DC02, Ubuntu, Windows 10, Windows 11 |
| Versie | Wazuh 4.7.5 |

---

## Infrastructuur

```
RHEL-WAZUH-01 (192.168.100.50)
    |
    +------ Wazuh Manager
    +------ Wazuh Indexer
    +------ Wazuh Dashboard
    |
    +------ Agent DC01        192.168.50.10
    +------ Agent DC02        192.168.50.11
    +------ Agent Ubuntu      192.168.50.20
    +------ Agent Windows 10  192.168.50.x
    +------ Agent Windows 11  192.168.50.x
```

---

## Wat ik heb gedaan

### Basisinstallatie
- RHEL 9 VM aangemaakt met 2 vCPU, 4GB RAM, 50GB schijf
- RHEL geregistreerd via Red Hat Developer account
- Systeem volledig geüpdatet via dnf
- Wazuh all-in-one installatie uitgevoerd
- Firewall geconfigureerd voor Wazuh poorten
- Dashboard bereikbaar via https://192.168.100.50

### Agents
- Wazuh agent geinstalleerd op alle 5 apparaten
- Alle agents geconfigureerd met Wazuh manager adres
- Alle 5 agents actief in dashboard

### Security Dashboard
- Eigen dashboard aangemaakt met widgets
- Top 5 agents met meeste alerts
- Alert trend over tijd grafiek
- MITRE ATT&CK matrix toegevoegd

### File Integrity Monitoring
- FIM ingeschakeld op DC01 voor C:\Shares en C:\Scripts
- Realtime monitoring geconfigureerd
- FIM getest met testbestand aanmaken en wijzigen
- Alerts zichtbaar in dashboard

### Brute Force detectie
- Meerdere mislukte logins gesimuleerd via PowerShell
- Wazuh detecteert brute force poging automatisch
- Alert level 10+ zichtbaar in dashboard
- Event 4625 gedetecteerd via Windows Security logs

### Security Compliance
- CIS benchmark scan uitgevoerd op DC01
- Compliance score zichtbaar in dashboard
- GDPR compliance overzicht bekeken
- PCI DSS compliance bekeken
- Security rapport gegenereerd

---

## Wazuh poorten

| Poort | Protocol | Gebruik |
|---|---|---|
| 443 | TCP | Dashboard HTTPS |
| 1514 | TCP/UDP | Agent communicatie |
| 1515 | TCP | Agent registratie |
| 55000 | TCP | REST API |
| 9200 | TCP | Wazuh Indexer |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Wazuh dashboard bereikbaar | Werkt |
| Alle 5 agents actief | Werkt |
| File Integrity Monitoring | Werkt |
| Brute force detectie | Werkt |
| CIS benchmark scan | Werkt |
| Security rapport genereren | Werkt |

---

## Wat ik heb geleerd

- Hoe Wazuh SIEM werkt als centrale security monitoring oplossing
- Hoe je Wazuh agents installeert op Windows en Linux
- Hoe File Integrity Monitoring werkt
- Hoe Wazuh brute force aanvallen detecteert
- Hoe je security compliance controleert via CIS benchmark
- Het belang van SIEM in een bedrijfsomgeving
- Hoe je security rapporten genereert

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 164-rhel-vm.png | RHEL VM in VMware |
| 165-rhel-ip.png | Statisch IP 192.168.100.50 |
| 166-rhel-subscription.png | Subscription geregistreerd |
| 167-rhel-update.png | dnf update voltooid |
| 168-wazuh-repo.png | Wazuh repository toegevoegd |
| 169-wazuh-install.png | Wazuh installatie bezig |
| 170-wazuh-credentials.png | Admin wachtwoord |
| 171-wazuh-dashboard.png | Wazuh login pagina |
| 172-wazuh-home.png | Wazuh dashboard |
| 173-wazuh-agents.png | Agents pagina |
| 174-wazuh-agent-dc01.png | Agent actief op DC01 |
| 175-wazuh-agent-ubuntu.png | Agent actief op Ubuntu |
| 176-wazuh-alle-agents.png | Alle 5 agents groen |
| 177-wazuh-alerts.png | Security alerts |
| 178-wazuh-security-events.png | Security events |
| 179-wazuh-dashboard-custom.png | Eigen dashboard |
| 180-wazuh-top-agents.png | Top 5 agents widget |
| 181-wazuh-alert-trend.png | Alert trend grafiek |
| 182-wazuh-mitre.png | MITRE ATT&CK matrix |
| 183-fim-config.png | FIM configuratie |
| 184-fim-test.png | FIM testbestand |
| 185-fim-alert.png | FIM alert in dashboard |
| 186-fim-details.png | FIM alert details |
| 187-bruteforce-simulatie.png | Brute force simulatie |
| 188-bruteforce-eventlog.png | Event 4625 log |
| 189-bruteforce-alert.png | Wazuh brute force alert |
| 190-bruteforce-details.png | Alert details |
| 191-sca-score.png | CIS benchmark score |
| 192-sca-checks.png | Compliance checks |
| 193-gdpr-compliance.png | GDPR overzicht |
| 194-pci-compliance.png | PCI DSS overzicht |
| 195-rapport-pdf.png | Security rapport |
