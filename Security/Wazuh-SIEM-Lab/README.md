# Wazuh SIEM Lab

Wazuh 4.7.5 geinstalleerd op RHEL 9 als centrale security monitoring oplossing.
Alle servers en clients worden bewaakt via Wazuh agents. File Integrity Monitoring,
Brute Force detectie en Security Compliance zijn geconfigureerd.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Wazuh Server | RHEL 9 — RHEL-WAZUH-01 — 192.168.100.50 |
| Dashboard | https://192.168.100.50 |
| Versie | Wazuh 4.7.5 |
| OS | Red Hat Enterprise Linux 9 |

---

## Netwerk topologie

```
RHEL-WAZUH-01 (192.168.100.50)
Wazuh Manager + Indexer + Dashboard
    |
    +-- Agent DC01     192.168.50.10  Windows Server 2025
    +-- Agent DC02     192.168.50.11  Windows Server 2025
    +-- Agent Ubuntu   192.168.50.20  Ubuntu 24.04
    +-- Agent Win10    192.168.50.x   Windows 10
    +-- Agent Win11    192.168.50.x   Windows 11
```

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

## Wat ik heb gedaan

### Installatie
- RHEL 9 VM aangemaakt — 2 vCPU, 4GB RAM, 50GB schijf
- Red Hat Developer account aangemaakt en geregistreerd
- RHEL 9 volledig geüpdatet via dnf
- Wazuh all-in-one installatie uitgevoerd
- Firewall geconfigureerd voor alle Wazuh poorten
- Dashboard bereikbaar via https://192.168.100.50

### Agents
- Wazuh agent geinstalleerd op DC01, DC02, Windows 10, Windows 11
- Wazuh agent geinstalleerd op Ubuntu via SCP — directe .deb installatie
- Alle 5 agents geconfigureerd en actief in dashboard

### Security Dashboard
- Eigen dashboard aangemaakt met meerdere widgets
- Top 5 agents met meeste alerts widget
- Alert trend over tijd grafiek
- MITRE ATT&CK matrix toegevoegd

### File Integrity Monitoring
- FIM ingeschakeld op DC01 voor C:\Shares en C:\Scripts
- Realtime monitoring geconfigureerd
- Testbestand aangemaakt, gewijzigd en verwijderd
- Alle drie de acties zichtbaar als alerts in dashboard

### Brute Force detectie
- 10 mislukte logins gesimuleerd via PowerShell op Windows 10
- Event 4625 gedetecteerd via Windows Security logs
- Wazuh alert level 10+ zichtbaar in dashboard
- Bewijs dat Wazuh aanvallen automatisch detecteert

### Security Compliance
- CIS benchmark scan uitgevoerd op DC01
- Compliance score zichtbaar in dashboard
- GDPR compliance overzicht bekeken
- PCI DSS compliance bekeken
- Security rapport gegenereerd

---

## Opgelost probleem

Wazuh agent kon niet worden geinstalleerd op Ubuntu via apt omdat
de GPG key niet correct werd geimporteerd op Ubuntu 24.04.
Oplossing: .deb pakket gedownload op RHEL en via SCP gekopieerd naar Ubuntu.

Wazuh dashboard startte niet door een YAML configuratie fout.
Oplossing: wazuh.yml handmatig gecorrigeerd met juiste veldnamen.

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Dashboard bereikbaar | Werkt |
| Alle 5 agents actief | Werkt |
| File Integrity Monitoring | Werkt |
| Brute force detectie | Werkt |
| CIS benchmark scan | Werkt |
| Security rapport | Werkt |
| MITRE ATT&CK matrix | Werkt |

---

## Wat ik heb geleerd

- Hoe Wazuh SIEM werkt als security monitoring oplossing
- Hoe je Wazuh agents installeert op Windows en Linux
- Hoe File Integrity Monitoring werkt
- Hoe Wazuh brute force aanvallen detecteert
- Hoe je security compliance controleert
- Hoe je MITRE ATT&CK gebruikt voor threat intelligence
- Het belang van SIEM in een bedrijfsomgeving

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 164-rhel-vm.png | RHEL VM aangemaakt in VMware |
| 165-rhel-ip.png | Statisch IP 192.168.100.50 |
| 166-rhel-subscription.png | Red Hat subscription geregistreerd |
| 167-rhel-update.png | dnf update voltooid |
| 168-wazuh-repo.png | Wazuh repository toegevoegd |
| 169-wazuh-install.png | Wazuh installatie bezig |
| 170-wazuh-credentials.png | Admin wachtwoord zichtbaar |
| 171-wazuh-dashboard.png | Wazuh login pagina |
| 172-wazuh-home.png | Wazuh dashboard |
| 173-wazuh-agents.png | Agents pagina |
| 174-wazuh-agent-dc01.png | Agent actief op DC01 |
| 175-wazuh-agent-ubuntu.png | Agent actief op Ubuntu |
| 176-wazuh-alle-agents.png | Alle 5 agents groen |
| 177-wazuh-alerts.png | Security alerts zichtbaar |
| 178-wazuh-security-events.png | Security events van DC01 |
| 179-wazuh-dashboard-custom.png | Eigen dashboard aangemaakt |
| 180-wazuh-top-agents.png | Top 5 agents widget |
| 181-wazuh-alert-trend.png | Alert trend grafiek |
| 182-wazuh-mitre.png | MITRE ATT&CK matrix |
| 183-fim-config.png | FIM configuratie in ossec.conf |
| 184-fim-test.png | Testbestand aangemaakt op DC01 |
| 185-fim-alert.png | FIM alert in dashboard |
| 186-fim-details.png | FIM alert details |
| 187-bruteforce-simulatie.png | Brute force simulatie output |
| 188-bruteforce-eventlog.png | Event 4625 in Windows log |
| 189-bruteforce-alert.png | Wazuh brute force alert level 10+ |
| 190-bruteforce-details.png | Alert details |
| 191-sca-score.png | CIS benchmark score DC01 |
| 192-sca-checks.png | Passed en failed checks |
| 193-gdpr-compliance.png | GDPR compliance overzicht |
| 194-pci-compliance.png | PCI DSS compliance overzicht |
| 195-rapport-pdf.png | Gegenereerd security rapport |
