# Scheduled Tasks Lab

Automatische taken geconfigureerd in Windows Server 2025 via
Task Scheduler. PowerShell scripts draaien automatisch op
vaste tijden zonder handmatige tussenkomst.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Tool | Task Scheduler |
| Scripts | systeem-rapport.ps1, inactieve-gebruikers.ps1 |

---

## Aangemakte taken

| Taaknaam | Schema | Tijd | Script |
|---|---|---|---|
| Dagelijks Systeem Rapport | Dagelijks | 08:00 | systeem-rapport.ps1 |
| Wekelijkse Inactieve Gebruikers Check | Wekelijks — maandag | 09:00 | inactieve-gebruikers.ps1 |

---

## Wat ik heb gedaan

- Task Scheduler geopend via Start menu
- Twee nieuwe taken aangemaakt via Create Basic Task wizard
- PowerShell script gekoppeld aan elke taak
- Taken handmatig getest via Start-ScheduledTask
- Resultaat gecontroleerd via Get-ScheduledTaskInfo
- Beide taken tonen LastTaskResult 0 — succesvol uitgevoerd

---

## Screenshots

### 1 — Task Scheduler met beide taken
![Task Scheduler](screenshots/62-task-scheduler.png)

Task Scheduler toont beide automatische taken.
Dagelijks Systeem Rapport en Wekelijkse Inactieve Gebruikers Check
zijn aangemaakt en actief.

---

### 2 — Get-ScheduledTask output
![Task status](screenshots/63-task-status.png)

PowerShell output van Get-ScheduledTask toont beide taken
met status Ready — klaar om uitgevoerd te worden.

---

### 3 — Taak resultaat na uitvoeren
![Task resultaat](screenshots/64-task-result.png)

Get-ScheduledTaskInfo toont LastTaskResult 0 — dit betekent
dat de taak succesvol is uitgevoerd zonder fouten.

---

## Waarom Scheduled Tasks belangrijk zijn

In een bedrijfsomgeving moeten veel taken automatisch worden
uitgevoerd zonder handmatige tussenkomst:

- Dagelijkse systeem rapporten voor de IT afdeling
- Wekelijkse controle van inactieve gebruikers
- Nachtelijke backups
- Periodieke opruimtaken

---

## Wat ik heb geleerd

- Hoe Task Scheduler werkt op Windows Server
- Hoe je PowerShell scripts automatisch laat uitvoeren
- Hoe je taken test en het resultaat controleert
- Het belang van automatisering in IT beheer
- Hoe je LastTaskResult interpreteert
