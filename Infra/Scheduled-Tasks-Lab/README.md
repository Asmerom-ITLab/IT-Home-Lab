# Scheduled Tasks Lab

PowerShell scripts automatisch laten draaien via Windows Task Scheduler
op Windows Server 2025. Twee taken zijn geconfigureerd voor dagelijkse
en wekelijkse automatisering.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| Tool | Task Scheduler |
| Scripts | C:\Scripts\ |

---

## Geconfigureerde taken

| Taaknaam | Schema | Tijd | Script |
|---|---|---|---|
| Dagelijks Systeem Rapport | Dagelijks | 08:00 | systeem-rapport.ps1 |
| Wekelijkse Inactieve Gebruikers Check | Wekelijks maandag | 09:00 | inactieve-gebruikers.ps1 |

---

## Wat ik heb gedaan

- Task Scheduler geopend via Start menu
- Twee nieuwe taken aangemaakt via Create Basic Task wizard
- PowerShell scripts gekoppeld aan elke taak
- Taken handmatig getest via Start-ScheduledTask
- Resultaat gecontroleerd — LastTaskResult 0 betekent succes
- Beide taken tonen LastTaskResult 0

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Taak handmatig gestart | Werkt |
| LastTaskResult 0 | Succesvol |
| Script wordt uitgevoerd | Werkt |

---

## Wat LastTaskResult betekent

| Waarde | Betekenis |
|---|---|
| 0 | Succesvol uitgevoerd |
| 1 | Fout opgetreden |
| 267009 | Taak wordt nog uitgevoerd |

---

## Wat ik heb geleerd

- Hoe Task Scheduler werkt op Windows Server
- Hoe je PowerShell scripts automatisch laat uitvoeren
- Hoe je taken test en het resultaat controleert
- Het belang van automatisering in IT beheer

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 62-task-scheduler.png | Task Scheduler met beide taken |
| 63-task-status.png | Beide taken status Ready |
| 64-task-result.png | LastTaskResult 0 — succesvol |
