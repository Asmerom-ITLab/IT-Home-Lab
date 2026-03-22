# Windows Update via Group Policy Lab

Windows Update geconfigureerd via Group Policy Objects voor
alle clients in het lab.local domein. Clients downloaden
updates automatisch op een vast tijdstip.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| Clients | Windows 10 en Windows 11 |
| Tool | Group Policy Management Console |

---

## Wat ik heb gedaan

- Nieuwe GPO aangemaakt — Windows Update Beleid
- GPO gekoppeld aan lab.local domein
- Automatische updates geconfigureerd via GPMC
- Update tijdstip ingesteld op 02:00 's nachts
- Automatische herstart uitgeschakeld tijdens werktijd
- GPO toegepast op Windows 10 en Windows 11 clients
- Registry instellingen gecontroleerd op clients
- Windows Update service gecontroleerd

---

## GPO Instellingen

| Policy | Instelling | Waarom |
|---|---|---|
| Configure Automatic Updates | Enabled — Auto download and schedule | Automatisch downloaden en installeren |
| Scheduled install time | 02:00 AM | Updates buiten werktijd installeren |
| No auto-restart with logged on users | Enabled | Geen herstart tijdens werktijd |
| Turn off access to Windows Update | Disabled | Gebruikers kunnen updates niet uitzetten |

---

## Wat ik heb geleerd

- Hoe Windows Update gecentraliseerd beheerd wordt via GPO
- Hoe je voorkomt dat updates tijdens werktijd worden geïnstalleerd
- Hoe je registry instellingen controleert voor GPO toepassing
- Het belang van update beheer in een bedrijfsomgeving
- Hoe je gpresult gebruikt om GPO toepassing te controleren

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 65-gpo-update-beleid.png | GPMC met Windows Update Beleid GPO |
| 66-gpo-update-settings.png | GPO instellingen geconfigureerd |
| 67-gpupdate-client.png | gpupdate /force op Windows 10 client |
| 68-update-registry.png | Registry instellingen op client |
| 69-update-service.png | Windows Update service status |
