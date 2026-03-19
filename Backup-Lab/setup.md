# Backup & Restore Lab — Setup

Stap voor stap uitleg van hoe ik de Backup & Restore lab heb uitgevoerd.

---

## Stap 1 — Windows Server Backup installeren

```powershell
Install-WindowsFeature -Name Windows-Server-Backup -IncludeManagementTools
```

Gecontroleerd met:

```powershell
Get-WindowsFeature -Name Windows-Server-Backup
```

---

## Stap 2 — Testbestand aanmaken

```powershell
New-Item -Path "C:\Shares\IT\belangrijk-document.txt" -ItemType File
Add-Content -Path "C:\Shares\IT\belangrijk-document.txt" `
  -Value "Dit is een belangrijk document - backup test"

Get-Content "C:\Shares\IT\belangrijk-document.txt"
```

---

## Stap 3 — Backup maken via Windows Server Backup GUI

```powershell
wbadmin.msc
```

Stappen in de GUI:

1. Klik op Local Backup
2. Klik op Backup Once
3. Kies Different options
4. Kies Custom
5. Klik Add items en selecteer C:\Shares\
6. Kies Local drives als bestemming
7. Selecteer C: als bestemming
8. Klik Backup

Gewacht tot de backup voltooid was.

---

## Stap 4 — Backup controleren

```powershell
Get-WBJob -Previous 1
```

Output toonde JobState: Completed.

---

## Stap 5 — Testbestand verwijderen

```powershell
Remove-Item -Path "C:\Shares\IT\belangrijk-document.txt" -Confirm:$false
Get-ChildItem C:\Shares\IT
```

Bestand was verwijderd uit de map.

---

## Stap 6 — Bestand herstellen via GUI

```powershell
wbadmin.msc
```

Stappen in de GUI:

1. Klik op Local Backup
2. Klik op Recover
3. Kies This server
4. Kies de datum van de backup
5. Kies Files and folders
6. Navigeer naar C:\Shares\IT\
7. Selecteer belangrijk-document.txt
8. Kies Original location
9. Klik Recover

---

## Stap 7 — Restore controleren

```powershell
Get-ChildItem C:\Shares\IT
Get-Content "C:\Shares\IT\belangrijk-document.txt"
```

Output: Dit is een belangrijk document - backup test

Bestand was succesvol hersteld!

---

## Wat ik heb geleerd

- Hoe Windows Server Backup werkt
- Hoe je een backup maakt van specifieke mappen
- Hoe je een bestand herstelt uit een backup
- Het belang van regelmatige backups in een bedrijfsomgeving
- Disaster Recovery procedures uitvoeren
