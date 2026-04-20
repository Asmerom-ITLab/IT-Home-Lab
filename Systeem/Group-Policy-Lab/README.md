# Windows Update via GPO Lab

Windows Update geconfigureerd via Group Policy voor alle clients
in het lab.local domein. Updates worden automatisch gedownload
en geinstalleerd om 02:00 buiten werktijd.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| GPO naam | Windows Update Beleid |
| Clients | Windows 10 en Windows 11 |

---

## GPO instellingen

| Policy | Instelling |
|---|---|
| Configure Automatic Updates | Enabled — Auto download and schedule |
| Scheduled install time | 02:00 AM |
| Scheduled install day | Every day |
| No auto-restart with logged on users | Enabled |

---

## Wat ik heb gedaan

- Nieuwe GPO aangemaakt — Windows Update Beleid
- GPO gekoppeld aan lab.local domein
- Automatische updates geconfigureerd via GPMC
- Update tijdstip ingesteld op 02:00
- Automatische herstart uitgeschakeld tijdens werktijd
- GPO toegepast op Windows 10 en Windows 11 clients
- Registry instellingen gecontroleerd op clients
- Windows Update service gecontroleerd

---

## Testresultaten

| Test | Resultaat |
|---|---|
| GPO actief op clients | Werkt |
| Registry instellingen correct | Werkt |
| AUOptions waarde 4 | Werkt |
| Geen herstart tijdens werktijd | Werkt |

---

## Wat ik heb geleerd

- Hoe Windows Update gecentraliseerd beheerd wordt via GPO
- Hoe je voorkomt dat updates tijdens werktijd worden geinstalleerd
- Hoe je registry instellingen controleert voor GPO toepassing
- Het belang van update beheer in een bedrijfsomgeving

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 65-gpo-update-beleid.png | GPMC met Windows Update Beleid |
| 66-gpo-update-settings.png | GPO instellingen geconfigureerd |
| 67-gpo-no-restart.png | No auto-restart instelling |
| 68-gpupdate-client.png | gpupdate /force op Windows 10 |
| 69-gpresult.png | gpresult met Windows Update Beleid |
| 70-update-registry.png | Registry instellingen op client |
