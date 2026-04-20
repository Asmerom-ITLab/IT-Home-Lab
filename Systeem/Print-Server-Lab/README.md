# Print Server Lab

Print Server geconfigureerd op Windows Server 2025.
Een virtuele printer is aangemaakt en via Group Policy
automatisch uitgerold naar alle clients in het domein.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| Printer naam | Lab-Printer |
| Share naam | Lab-Printer |
| Share pad | \\DC01\Lab-Printer |
| Driver | Generic / Text Only |
| Clients | Windows 10 en Windows 11 |

---

## Wat ik heb gedaan

- Print Server rol geinstalleerd op DC01
- Generic printer driver geinstalleerd
- Virtuele printer aangemaakt op LPT1 poort
- Printer gedeeld via SMB share
- GPO aangemaakt — Printer Beleid
- Printer automatisch uitgerold naar clients via GPO
- Printer getest op Windows 10 client
- Print queue gecontroleerd via printmanagement.msc

---

## Testresultaten

| Test | Resultaat |
|---|---|
| Printer aangemaakt op DC01 | Werkt |
| Printer gedeeld via SMB | Werkt |
| Printer zichtbaar op Windows 10 | Werkt |
| GPO printer uitrollen | Werkt |
| Print queue zichtbaar | Werkt |

---

## Waarom Print Server belangrijk is

In een bedrijfsomgeving wil je printers centraal beheren.
Via een Print Server kunnen alle medewerkers dezelfde printers
gebruiken zonder dat elke computer apart geconfigureerd moet worden.

---

## Wat ik heb geleerd

- Hoe een Print Server werkt op Windows Server
- Hoe je een printer deelt via SMB
- Hoe je printers uitrolt via Group Policy
- Hoe je Print Management gebruikt
- Het belang van centrale printerbeheer

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 146-print-role.png | Print Server rol geinstalleerd |
| 147-print-printer.png | Lab-Printer aangemaakt op DC01 |
| 148-print-gpo.png | GPO voor printer uitrollen |
| 149-print-client.png | Printer zichtbaar op Windows 10 |
| 150-print-queue.png | Print queue in printmanagement.msc |
