# Tweede Domain Controller Lab

Een tweede Domain Controller (DC02) toegevoegd aan het bestaande
lab.local domein voor redundantie en hoge beschikbaarheid.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Primaire DC | DC01 — 192.168.100.10 |
| Secundaire DC | DC02 — 192.168.100.11 |
| Domein | lab.local |
| Hypervisor | VMware Workstation |

---

## Wat is een tweede Domain Controller?

In een bedrijfsomgeving heb je altijd minimaal twee Domain Controllers.
Als DC01 uitvalt door een storing of onderhoud, neemt DC02 automatisch
over. Gebruikers kunnen dan nog steeds inloggen en werken.

Dit heet redundantie — een essentieel concept in IT infrastructuur.

---

## Wat ik heb gedaan

- DC01 VM gekloond in VMware Workstation
- Gekloonde VM hernoemd naar DC02
- Statisch IP ingesteld op 192.168.100.11
- Onnodige rollen verwijderd van DC02
- DC02 gejoined aan lab.local domein
- AD DS rol geinstalleerd op DC02
- DC02 gepromoveerd als extra Domain Controller
- AD replicatie gecontroleerd tussen DC01 en DC02
- Failover getest — DC01 uitgeschakeld en DC02 overneemt

---

## Netwerk overzicht

| Machine | IP | Rol |
|---|---|---|
| DC01 | 192.168.100.10 | Primaire Domain Controller |
| DC02 | 192.168.100.11 | Secundaire Domain Controller |
| Ubuntu Server | 192.168.100.20 | Linux Server |
| Windows 10 | 192.168.100.12 | Client |
| Windows 11 | 192.168.100.13 | Client |

---

## Wat ik heb geleerd

- Hoe je een tweede Domain Controller toevoegt aan een bestaand domein
- Hoe AD replicatie werkt tussen twee Domain Controllers
- Het belang van redundantie in een bedrijfsomgeving
- Hoe je een Domain Controller promoveert via PowerShell
- Hoe je failover test tussen twee Domain Controllers

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 84-dc02-promoted.png | DC02 gepromoveerd als Domain Controller |
| 85-dc02-login.png | Login scherm DC02 met LAB\Administrator |
| 86-aduc-two-dc.png | ADUC toont DC01 en DC02 |
| 87-dc02-replication.png | AD replicatie tussen DC01 en DC02 |
| 88-dc02-failover.png | Failover test — DC02 neemt over van DC01 |
