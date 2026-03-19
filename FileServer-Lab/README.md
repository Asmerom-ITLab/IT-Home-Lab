# File Server Lab

File server opgezet op Windows Server 2025 met gedeelde mappen
per afdeling en NTFS toegangsrechten.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| Pad | C:\Shares\ |
| Gebruikers | 20 gebruikers in 5 afdelingen |

---

## Wat ik heb gedaan

- 5 mappen aangemaakt onder C:\Shares\
- Alle mappen gedeeld via SMB
- 5 security groepen aangemaakt per afdeling
- 20 gebruikers aangemaakt via PowerShell script
- Gebruikers toegevoegd aan de juiste groepen
- NTFS permissions ingesteld per afdeling
- Toegang getest vanuit Windows 10 client

---

## Mappen structuur

```
C:\Shares\
├── HR\         — alleen HR-Groep
├── IT\         — alleen IT-Groep
├── Management\ — alleen Management-Groep
├── Finance\    — alleen Finance-Groep
└── Sales\      — alleen Sales-Groep
```

---

## Gebruikers per afdeling

| Afdeling | Groep | Gebruikers |
|---|---|---|
| HR | HR-Groep | hr-user1 t/m hr-user4 |
| IT | IT-Groep | it-user1 t/m it-user4 |
| Management | Management-Groep | mgmt-user1 t/m mgmt-user4 |
| Finance | Finance-Groep | fin-user1 t/m fin-user4 |
| Sales | Sales-Groep | sales-user1 t/m sales-user4 |

---

## Resultaat

Alle 5 mappen zijn gedeeld via SMB en beveiligd met NTFS permissions.
Elke afdeling heeft alleen toegang tot zijn eigen map.

---

## Vaardigheden

- File server configuratie op Windows Server
- SMB shares aanmaken en beheren
- NTFS permissions instellen
- Active Directory security groepen
- Toegangsbeheer per afdeling
- PowerShell voor bulk gebruikers aanmaken

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 19-shares.png | Get-SmbShare output |
| 20-gebruikers.png | ADUC met gebruikers |
| 21-groepen.png | ADUC met groepen |
| 22-permissions.png | NTFS permissions ingesteld |
| 23-fileshare-test.png | Toegang getest vanuit client |
