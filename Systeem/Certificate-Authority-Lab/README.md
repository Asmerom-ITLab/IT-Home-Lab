# Certificate Authority Lab

Active Directory Certificate Services geconfigureerd op Windows Server 2025.
Een eigen Certificate Authority is aangemaakt voor het uitgeven van
SSL certificaten binnen het lab.local domein.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| CA naam | lab-CA |
| CA type | Enterprise Root CA |
| Geldigheid | 5 jaar |
| Algoritme | SHA256 — 2048 bit |

---

## Wat ik heb gedaan

- AD CS rol geinstalleerd op DC01
- Enterprise Root CA geconfigureerd met naam lab-CA
- Certificaat template aangemaakt — Lab Web Server
- Certificaat aangevraagd voor DC01.lab.local
- CA certificaat geëxporteerd naar C:\lab-CA.cer
- GPO aangemaakt — CA Vertrouwen Beleid
- CA certificaat geimporteerd via GPO
- Certificaat vertrouwd op Windows 10 client gecontroleerd

---

## CA configuratie

| Instelling | Waarde |
|---|---|
| CA naam | lab-CA |
| CA type | Enterprise Root CA |
| Geldigheid | 5 jaar |
| Hash algoritme | SHA256 |
| Key length | 2048 bit |

---

## Certificaat template

| Instelling | Waarde |
|---|---|
| Template naam | Lab Web Server |
| Gebaseerd op | Web Server template |
| Geldigheid | 2 jaar |
| Rechten | Domain Computers — Enroll |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| CA rol geinstalleerd | Werkt |
| CA geconfigureerd | Werkt |
| Template aangemaakt | Werkt |
| Certificaat aangevraagd | Werkt |
| CA certificaat geëxporteerd | Werkt |
| GPO voor CA vertrouwen | Werkt |
| CA vertrouwd op Windows 10 | Werkt |

---

## Waarom Certificate Authority belangrijk is

In een bedrijfsomgeving worden SSL certificaten gebruikt voor:
- Versleutelde verbindingen via HTTPS
- Authenticatie van servers en gebruikers
- VPN verbindingen
- Digitale handtekeningen

Een eigen CA geeft volledige controle over certificaten.

---

## Wat ik heb geleerd

- Hoe een Certificate Authority werkt
- Hoe je een Enterprise Root CA configureert
- Hoe je certificaat templates aanmaakt
- Hoe je certificaten aanvraagt via PowerShell
- Hoe je CA certificaten vertrouwd maakt via GPO
- Het belang van PKI in een bedrijfsomgeving

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 151-ca-role.png | AD CS rol geinstalleerd op DC01 |
| 152-ca-configured.png | CA geconfigureerd — certsrv.msc |
| 153-ca-template.png | Lab Web Server template aangemaakt |
| 154-ca-certificate.png | Certificaat aangevraagd en uitgegeven |
| 155-ca-gpo.png | CA certificaat geimporteerd via GPO |
