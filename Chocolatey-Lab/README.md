# Chocolatey Lab

Chocolatey package manager geinstalleerd op Windows Server 2025.
Software automatisch geinstalleerd en beheerd via PowerShell.

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
| Clients | Windows 10 en Windows 11 |
| Tool | Chocolatey + PowerShell |

---

## Wat ik heb gedaan

- Chocolatey geinstalleerd op Windows Server 2025
- Software geinstalleerd via choco install commando
- Geinstalleerde software bekeken via choco list
- Software geupdate via choco upgrade
- Chocolatey geinstalleerd op Windows 10 client
- Software uitgerold naar client via PowerShell script

---

## Software geinstalleerd via Chocolatey

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

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 70-chocolatey-install.png | Chocolatey installatie voltooid |
| 71-choco-install-software.png | Software installatie via choco |
| 72-choco-list.png | Geinstalleerde software lijst |
| 73-choco-upgrade.png | Software update via choco upgrade |
| 74-choco-client.png | Chocolatey op Windows 10 client |
