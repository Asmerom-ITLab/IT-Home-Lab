# WSUS Lab — Windows Server Update Services

Windows Server Update Services geconfigureerd op DC01 als centrale
update server. Alle clients ontvangen Windows updates via de WSUS
server in plaats van rechtstreeks van Microsoft.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| WSUS poort | 8530 |
| Update map | C:\WSUS |
| Clients | Windows 10 en Windows 11 |
| GPO | WSUS Beleid |

---

## WSUS configuratie

| Instelling | Waarde |
|---|---|
| Upstream server | Microsoft Update |
| Talen | Dutch, English |
| Products | Windows 10, Windows 11, Windows Server 2025 |
| Classifications | Critical Updates, Security Updates |
| Sync schema | Dagelijks 02:00 |

---

## Opgelost probleem

Bij de eerste installatie gaf WSUS een SQL database timeout.
Oorzaak: VM had te weinig RAM en de SQL timeout was te kort.
Oplossing: SQL timeout verhoogd naar 7200 seconden via registry
en VM RAM verhoogd naar 6GB.

---

## Wat ik heb gedaan

- WSUS rol geinstalleerd op DC01
- SQL timeout verhoogd voor betrouwbare installatie
- WSUS map aangemaakt op C:\WSUS
- WSUS geconfigureerd via setup wizard
- Synchronisatie ingesteld met Microsoft Update
- GPO aangemaakt voor WSUS clients
- Clients geconfigureerd via GPO
- Client zichtbaar in WSUS console

---

## Testresultaten

| Test | Resultaat |
|---|---|
| WSUS installatie | Succesvol |
| Synchronisatie gestart | Werkt |
| GPO toegepast op clients | Werkt |
| Client zichtbaar in WSUS | Werkt |

---

## Wat ik heb geleerd

- Hoe WSUS werkt als centrale update server
- Hoe je update policies configureert
- Hoe je clients naar WSUS stuurt via GPO
- Hoe je SQL timeout instelt voor betrouwbare installatie
- Het belang van gecentraliseerd update beheer

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 160-wsus-install.png | WSUS installatie Success True |
| 161-wsus-wizard.png | WSUS configuratie wizard |
| 162-wsus-sync.png | Synchronisatie bezig |
| 163-wsus-dashboard.png | WSUS dashboard na sync |
| 164-wsus-gpo.png | GPO voor WSUS clients |
| 165-wsus-client.png | Client zichtbaar in WSUS |
