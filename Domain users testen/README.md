# Domain Users Lab

Domein gebruikers getest op Windows 10 en Windows 11 clients.
NTFS permissions gecontroleerd en gecorrigeerd per afdeling.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| Clients | Windows 10 en Windows 11 |
| Gebruikers getest | hr-user1, it-user1 |

---

## Wat ik heb gedaan

- Ingelogd op Windows 10 als hr-user1 via LAB\hr-user1
- Groepslidmaatschap gecontroleerd via whoami /groups
- File Share toegang getest voor alle 5 mappen
- NTFS permissions gecorrigeerd via Advanced Security Settings
- Everyone en Users verwijderd van alle mappen
- Alleen juiste groep toegang gegeven per map
- SMB share permissions ingesteld via Server Manager
- Toegang opnieuw getest — hr-user1 heeft alleen toegang tot HR map

---

## Testresultaten

| Gebruiker | Map | Toegang |
|---|---|---|
| hr-user1 | HR | Toegang |
| hr-user1 | IT | Geblokkeerd |
| hr-user1 | Management | Geblokkeerd |
| hr-user1 | Finance | Geblokkeerd |
| hr-user1 | Sales | Geblokkeerd |

---

## Screenshots

### 1 — Login scherm met hr-user1
![Login scherm](screenshots/55-hr-login.png)

Ingelogd als LAB\hr-user1 op Windows 10 client.
Dit bewijst dat domein gebruikers kunnen inloggen op clients.

---

### 2 — whoami /groups output
![whoami groups](screenshots/56-whoami.png)

Output van whoami /groups toont dat hr-user1 lid is van LAB\HR-Groep.
Dit bewijst dat Active Directory groepslidmaatschap correct werkt.

---

### 3 — HR map toegang
![HR toegang](screenshots/57-hr-toegang.png)

HR map opent zonder problemen voor hr-user1.
De NTFS permissions geven HR-Groep volledige toegang tot deze map.

---

### 4 — IT map geblokkeerd
![IT geblokkeerd](screenshots/58-it-geblokkeerd.png)

Toegang geweigerd bij de IT map voor hr-user1.
Dit bewijst dat NTFS permissions correct werken per afdeling.

---

### 5 — LastLogonDate controle op server
![LastLogon](screenshots/59-lastlogon.png)

Get-ADUser toont de laatste inlogtijd van hr-user1.
Dit bewijst dat de domein login correct is geregistreerd in AD.

---

## Wat ik heb geleerd

- Hoe domein gebruikers inloggen op een Windows client
- Hoe NTFS permissions werken in combinatie met AD groepen
- Het verschil tussen SMB share permissions en NTFS permissions
- Hoe je permissions corrigeert via Advanced Security Settings
- Hoe je toegang test vanuit een domein gebruiker perspectief
