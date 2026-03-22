# Chocolatey Lab

Chocolatey package manager geinstalleerd op Windows Server 2025,
Windows 10 en Windows 11. Software automatisch geinstalleerd
en beheerd via PowerShell.

---

## Wat is Chocolatey?

Chocolatey is een package manager voor Windows — vergelijkbaar met
apt op Linux. Je installeert software via de command line zonder
handmatig installers te downloaden en uit te voeren.

In een bedrijfsomgeving gebruik je Chocolatey om software op
meerdere computers tegelijk te installeren en up to date te houden.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Client 1 | Windows 10 — 192.168.100.12 |
| Client 2 | Windows 11 — 192.168.100.13 |
| Tool | Chocolatey + PowerShell |

---

## Wat ik heb gedaan

- Chocolatey geinstalleerd op Windows Server 2025
- Software geinstalleerd via choco install commando
- Geinstalleerde software bekeken via choco list
- Software geupdate via choco upgrade all
- Chocolatey geinstalleerd op Windows 10 client
- Chocolatey geinstalleerd op Windows 11 client
- Software getest op alle drie de machines

---

## Chocolatey installatie per machine

| Machine | Chocolatey | Software getest |
|---|---|---|
| Windows Server 2025 | ✅ Geinstalleerd | 7zip, Notepad++, Chrome, VLC |
| Windows 10 Client | ✅ Geinstalleerd | 7zip |
| Windows 11 Client | ✅ Geinstalleerd | 7zip |

---

## Software geinstalleerd via Chocolatey op server

| Software | Commando |
|---|---|
| 7-Zip | choco install 7zip -y |
| Notepad++ | choco install notepadplusplus -y |
| Google Chrome | choco install googlechrome -y |
| VLC | choco install vlc -y |

---

## Wat ik heb geleerd

- Hoe Chocolatey werkt als package manager voor Windows
- Hoe je software installeert via de command line
- Hoe je software up to date houdt via choco upgrade
- Hoe je software uitrolt naar meerdere machines via PowerShell
- Het belang van geautomatiseerde software installatie in IT
- Hoe je netwerk problemen oplost op een domein client

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 71-chocolatey-install.png | Chocolatey installatie voltooid op server |
| 72-choco-install-software.png | Software installatie via choco op server |
| 73-choco-list.png | Geinstalleerde software lijst op server |
| 74-choco-upgrade.png | Software update via choco upgrade all |
| 75-choco-client.png | Chocolatey geinstalleerd op Windows 10 |
| 76-choco-win11.png | Chocolatey versie op Windows 11 |
| 77-choco-win11-software.png | choco list op Windows 11 |
