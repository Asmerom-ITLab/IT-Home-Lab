# File Server Lab

File server opgezet op DC01 met 5 gedeelde mappen voor de 5 afdelingen.
NTFS rechten zijn per afdeling ingesteld zodat medewerkers alleen bij
hun eigen map kunnen.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| Shares pad | C:\Shares |
| Domein | lab.local |

---

## Gedeelde mappen

| Map | Share naam | Groep | Rechten |
|---|---|---|---|
| C:\Shares\HR | HR | HR-Groep | Volledig |
| C:\Shares\IT | IT | IT-Groep | Volledig |
| C:\Shares\Management | Management | Management-Groep | Volledig |
| C:\Shares\Finance | Finance | Finance-Groep | Volledig |
| C:\Shares\Sales | Sales | Sales-Groep | Volledig |

---

## Wat ik heb gedaan

- 5 mappen aangemaakt onder C:\Shares
- SMB shares aangemaakt voor elke map
- NTFS rechten ingesteld per afdeling via Advanced Security Settings
- Everyone en Users verwijderd van alle mappen
- Alleen de juiste groep toegang gegeven per map
- Domain Admins volledige toegang gegeven op alle mappen
- Toegang getest vanuit domein gebruiker perspectief

---

## Testresultaten

| Test | Resultaat |
|---|---|
| hr-user1 bij HR map | Toegang |
| hr-user1 bij IT map | Geblokkeerd |
| it-user1 bij IT map | Toegang |
| it-user1 bij HR map | Geblokkeerd |
| Domain Admin bij alle mappen | Toegang |

---

## Wat ik heb geleerd

- Hoe SMB shares werken op Windows Server
- Het verschil tussen SMB en NTFS rechten
- Hoe je rechten instelt via Advanced Security Settings
- Hoe je toegang test vanuit een domein gebruiker
- Het belang van correcte NTFS rechten voor beveiliging

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 20-shares-aangemaakt.png | 5 gedeelde mappen in Server Manager |
| 21-ntfs-rechten.png | NTFS rechten per map |
| 22-hr-toegang.png | hr-user1 heeft toegang tot HR map |
| 23-it-geblokkeerd.png | hr-user1 geblokkeerd bij IT map |
