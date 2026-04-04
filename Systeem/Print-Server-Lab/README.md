# Print Server Lab

Print Server geconfigureerd op Windows Server 2025.
Virtuele printer aangemaakt en uitgerold naar alle clients
via Group Policy.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
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
- GPO aangemaakt voor automatisch uitrollen printer
- Printer getest op Windows 10 client
- Print queue gecontroleerd via printmanagement.msc

---

## Print Server configuratie

| Instelling | Waarde |
|---|---|
| Printer naam | Lab-Printer |
| Driver | Generic / Text Only |
| Poort | LPT1 |
| Share naam | Lab-Printer |
| GPO | Printer Beleid |

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

## Wat ik heb geleerd

- Hoe een Print Server werkt op Windows Server
- Hoe je een printer deelt via SMB
- Hoe je printers uitrolt via Group Policy
- Hoe je Print Management gebruikt
- Het belang van centrale printerbeheer in een bedrijf

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 146-print-role.png | Print Server rol geinstalleerd |
| 147-print-printer.png | Lab-Printer aangemaakt op DC01 |
| 148-print-gpo.png | GPO voor printer uitrollen |
| 149-print-client.png | Printer zichtbaar op Windows 10 |
| 150-print-queue.png | Print queue in printmanagement.msc |
