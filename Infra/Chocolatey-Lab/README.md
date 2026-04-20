# Chocolatey Lab

Chocolatey package manager geinstalleerd op Windows Server 2025,
Windows 10 en Windows 11. Software wordt automatisch geinstalleerd
via de command line zonder handmatige installers.

---

## Omgeving

| Machine | Chocolatey versie | Status |
|---|---|---|
| DC01 — Windows Server 2025 | 2.x | Geinstalleerd |
| Windows 10 | 2.x | Geinstalleerd |
| Windows 11 | 2.x | Geinstalleerd |

---

## Geinstalleerde software via Chocolatey

| Software | Commando |
|---|---|
| 7-Zip | choco install 7zip -y |
| Notepad++ | choco install notepadplusplus -y |
| Google Chrome | choco install googlechrome -y |
| VLC | choco install vlc -y |

---

## Wat ik heb gedaan

- Chocolatey geinstalleerd op Windows Server 2025
- Meerdere softwarepakketten geinstalleerd via choco install
- Geinstalleerde software bekeken via choco list
- Software bijgewerkt via choco upgrade all
- Chocolatey geinstalleerd op Windows 10 client
- Chocolatey geinstalleerd op Windows 11 client
- 7zip geinstalleerd op beide clients als test

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Chocolatey op Windows Server | Werkt |
| Chocolatey op Windows 10 | Werkt |
| Chocolatey op Windows 11 | Werkt |
| Software installatie via choco | Werkt |
| Software update via choco | Werkt |

---

## Waarom Chocolatey

In een bedrijfsomgeving wil je software automatisch kunnen installeren
op meerdere computers tegelijk. Chocolatey maakt dit mogelijk via
een eenvoudig commando. Dit bespaart veel tijd bij het opzetten van
nieuwe computers.

---

## Wat ik heb geleerd

- Hoe Chocolatey werkt als package manager voor Windows
- Hoe je software installeert via de command line
- Hoe je software up to date houdt via choco upgrade
- Hoe je software uitrolt naar meerdere machines
- Het belang van geautomatiseerde software installatie

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 71-chocolatey-install.png | Chocolatey installatie voltooid |
| 72-choco-install-software.png | Software installatie via choco |
| 73-choco-list.png | Geinstalleerde software lijst |
| 74-choco-upgrade.png | Software update via choco upgrade |
| 75-choco-client.png | Chocolatey op Windows 10 |
| 76-choco-win11.png | Chocolatey op Windows 11 |
