# Windows Security Lab

Microsoft Defender en Windows Firewall geconfigureerd op Windows Server 2025.
Een PowerShell script genereert automatisch een security rapport met
de status van Defender, Firewall en recente security events.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| Tool | Microsoft Defender, Windows Firewall, PowerShell |
| Script | C:\Scripts\security-rapport.ps1 |

---

## Security status

| Instelling | Status |
|---|---|
| Antivirus | Ingeschakeld |
| Real-time beveiliging | Ingeschakeld |
| Behavior monitoring | Ingeschakeld |
| Script scanning | Ingeschakeld |
| Firewall Domain profiel | Ingeschakeld |
| Firewall Private profiel | Ingeschakeld |
| Firewall Public profiel | Ingeschakeld |

---

## Wat ik heb gedaan

- Microsoft Defender status gecontroleerd via PowerShell
- Real-time beveiliging ingeschakeld
- Defender definities bijgewerkt
- Quick scan uitgevoerd via PowerShell
- Windows Firewall aangezet op alle profielen
- Security event logs bekeken
- PowerShell script geschreven voor automatisch rapport
- Script opgeslagen als C:\Scripts\security-rapport.ps1

---

## Security rapport script

Het script genereert automatisch een rapport van:
- Microsoft Defender status
- Firewall status per profiel
- Laatste 5 security events
- Laatste geinstalleerde Windows updates

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Defender ingeschakeld | Werkt |
| Quick scan uitgevoerd | Werkt |
| Firewall alle profielen aan | Werkt |
| Security rapport script | Werkt |

---

## Wat ik heb geleerd

- Hoe Microsoft Defender geconfigureerd wordt via PowerShell
- Hoe Windows Firewall profielen werken
- Hoe je security event logs leest
- Hoe je een automatisch security rapport maakt
- Het belang van beveiliging op een Windows Server

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 88-defender-status.png | Get-MpComputerStatus output |
| 89-defender-settings.png | Real-time beveiliging ingeschakeld |
| 90-defender-scan.png | Quick scan gestart |
| 91-defender-update.png | Defender definities bijgewerkt |
| 92-security-rapport.png | Security rapport output |
| 93-event-logs.png | Security event logs |
| 94-firewall-status.png | Firewall profielen actief |
