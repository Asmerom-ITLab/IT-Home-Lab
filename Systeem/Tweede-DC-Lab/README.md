# Tweede Domain Controller Lab

Een tweede Domain Controller DC02 toegevoegd aan het lab.local domein
voor redundantie. Als DC01 uitvalt neemt DC02 automatisch over.
DHCP Failover en DFS Replicatie zijn geconfigureerd.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Primaire DC | DC01 — 192.168.50.10 |
| Secundaire DC | DC02 — 192.168.50.11 |
| Domein | lab.local |

---

## Wat ik heb gedaan

- Windows Server 2025 schoon geinstalleerd voor DC02
- Statisch IP ingesteld op 192.168.50.11
- DC02 gejoined aan lab.local domein
- AD DS rol geinstalleerd op DC02
- DC02 gepromoveerd als extra Domain Controller
- AD replicatie gecontroleerd — 0 fouten
- DHCP Failover geconfigureerd tussen DC01 en DC02
- DFS Replicatie ingesteld voor C:\Shares
- Windows Server Backup geinstalleerd op DC02
- Failover getest door DC01 tijdelijk uit te zetten

---

## Opgelost probleem

Bij de eerste poging was DC02 een kloon van DC01. Dit gaf database
conflicten bij de promotie. Oplossing: DC02 opnieuw geinstalleerd
vanuit een schone Windows Server 2025 ISO.

---

## DHCP Failover

| Instelling | Waarde |
|---|---|
| Naam | DC01-DC02-Failover |
| Modus | Load Balance 50/50 |
| Scope | 192.168.50.0 |
| Status | Normal |

---

## DFS Replicatie

| Instelling | Waarde |
|---|---|
| Groep | Shares-Replicatie |
| Primaire server | DC01 |
| Secundaire server | DC02 |
| Pad | C:\Shares |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| AD replicatie — 0 fouten | Werkt |
| DHCP failover actief | Werkt |
| DFS replicatie actief | Werkt |
| DC01 uitgezet — DC02 neemt over | Werkt |
| Bestand op DC01 zichtbaar op DC02 | Werkt |

---

## Wat ik heb geleerd

- Hoe je een tweede Domain Controller toevoegt
- Hoe AD replicatie werkt tussen twee DCs
- Hoe DHCP Failover werkt
- Hoe DFS Replicatie bestanden synchroniseert
- Het belang van redundantie in een bedrijfsomgeving
- Een Domain Controller klonen werkt NIET — altijd schone installatie

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 84-dc02-promoted.png | DC02 gepromoveerd als Domain Controller |
| 85-dc02-login.png | Login scherm DC02 |
| 86-aduc-two-dc.png | Beide DCs zichtbaar in ADUC |
| 87-dc02-replication.png | AD replicatie — 0 fouten |
| 121-dhcp-failover.png | DHCP Failover status Normal |
| 122-dfs-replication.png | DFS Replicatie actief |
| 123-dc02-backup.png | Backup schema op DC02 |
| 124-failover-test.png | DC01 gestopt — DC02 neemt over |
