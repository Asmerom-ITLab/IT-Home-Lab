# Backup en Restore Lab

Windows Server Backup geconfigureerd op DC01 en DC02.
Een dagelijks backup schema is ingesteld en een bestand is
succesvol hersteld na verwijdering als bewijs.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 en DC02 — Windows Server 2025 |
| Backup tool | Windows Server Backup |
| Backup schema | Dagelijks 02:00 |
| Backup bron | C:\Shares |

---

## Wat ik heb gedaan

- Windows Server Backup rol geinstalleerd op DC01 en DC02
- Dagelijks backup schema ingesteld op 02:00
- Backup gemaakt van C:\Shares map
- Testbestand aangemaakt in C:\Shares\IT
- Testbestand verwijderd
- Bestand succesvol hersteld via Windows Server Backup
- DHCP Failover geconfigureerd tussen DC01 en DC02
- DFS Replicatie ingesteld voor automatische synchronisatie

---

## DC02 Redundancy

| Functie | Details |
|---|---|
| DHCP Failover | Load Balance 50/50 tussen DC01 en DC02 |
| DFS Replicatie | C:\Shares gesynchroniseerd tussen DC01 en DC02 |
| Backup schema | Dagelijks 02:00 op DC02 |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Backup aangemaakt | Werkt |
| Bestand hersteld | Werkt |
| DHCP failover | Werkt |
| DFS replicatie | Werkt |
| DC01 gestopt — DC02 neemt over | Werkt |

---

## Wat ik heb geleerd

- Hoe Windows Server Backup werkt
- Hoe je een backup schema instelt
- Hoe je bestanden herstelt na verwijdering
- Hoe DHCP Failover werkt tussen twee servers
- Hoe DFS Replicatie bestanden synchroniseert
- Het belang van redundantie en backup in een bedrijf

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 29-backup-rol.png | Windows Server Backup geinstalleerd |
| 30-backup-schema.png | Dagelijks backup schema ingesteld |
| 31-backup-gemaakt.png | Backup succesvol aangemaakt |
| 32-herstel.png | Bestand hersteld na verwijdering |
| 121-dhcp-failover.png | DHCP Failover status Normal |
| 122-dfs-replication.png | DFS Replicatie actief |
