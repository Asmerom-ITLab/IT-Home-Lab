# Backup & Restore Lab

Windows Server Backup geconfigureerd op Windows Server 2025.
Backup gemaakt van de Shares map en een bestand succesvol hersteld.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Tool | Windows Server Backup |
| Backup bron | C:\Shares\ |
| Backup doel | Lokale schijf C: |

---

## Wat ik heb gedaan

- Windows Server Backup rol geinstalleerd
- Testbestand aangemaakt in C:\Shares\IT\
- Backup gemaakt via Windows Server Backup GUI
- Testbestand verwijderd om restore te testen
- Bestand succesvol hersteld uit backup
- Resultaat gecontroleerd via PowerShell

---

## Resultaat

Backup en restore werkt correct. Het testbestand is succesvol
hersteld na het verwijderen.

---

## Vaardigheden

- Windows Server Backup installatie en configuratie
- Backup strategie opzetten
- Disaster Recovery procedures
- Bestand herstel uit backup
- wbadmin.msc gebruiken

---

## Waarom backup belangrijk is

In een bedrijfsomgeving kan data verloren gaan door:
- Per ongeluk verwijderen van bestanden
- Hardware storingen
- Ransomware aanvallen
- Menselijke fouten

Een goede backup strategie zorgt dat data altijd hersteld
kan worden.

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 43-backup-install.png | Windows Server Backup geinstalleerd |
| 44-backup-completed.png | Backup succesvol voltooid |
| 45-bestand-weg.png | Testbestand verwijderd |
| 46-restore-gelukt.png | Bestand hersteld uit backup |
