# Windows Security Lab

Microsoft Defender en Windows Firewall geconfigureerd en getest
op Windows Server 2025. Security rapport gegenereerd via PowerShell.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| Tool | Microsoft Defender, Windows Firewall, PowerShell |

---

## Wat ik heb gedaan

- Microsoft Defender status gecontroleerd via PowerShell
- Real-time beveiliging ingeschakeld op de server
- Defender definities bijgewerkt
- Quick scan uitgevoerd via PowerShell
- Windows Firewall aangezet op alle profielen
- Security event logs bekeken
- PowerShell script gemaakt voor automatisch security rapport

---

## Security status na configuratie

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

## PowerShell script

Script aangemaakt: `C:\Scripts\security-rapport.ps1`

Het script genereert automatisch een rapport van:
- Microsoft Defender status
- Firewall status per profiel
- Laatste 5 security event logs
- Laatste geinstalleerde Windows updates

---

## Wat ik heb geleerd

- Hoe Microsoft Defender geconfigureerd wordt via PowerShell
- Hoe Windows Firewall profielen werken
- Hoe je security event logs leest en interpreteert
- Hoe je een automatisch security rapport maakt via PowerShell
- Het belang van beveiliging op een Windows Server

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 88-defender-status.png | Get-MpComputerStatus output |
| 89-defender-settings.png | Real-time beveiliging ingeschakeld |
| 90-defender-scan.png | Quick scan gestart |
| 91-defender-update.png | Defender definities bijgewerkt |
| 92-security-rapport.png | Volledig security rapport output |
| 93-event-logs.png | Security event logs |
| 94-firewall-status.png | Firewall profielen actief |
| 95-script-opgeslagen.png | Security rapport script output |
