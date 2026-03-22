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

## Wat ik heb geleerd

- Hoe domein gebruikers inloggen op een Windows client
- Hoe NTFS permissions werken in combinatie met AD groepen
- Het verschil tussen SMB share permissions en NTFS permissions
- Hoe je permissions corrigeert via Advanced Security Settings
- Hoe je toegang test vanuit een domein gebruiker perspectief

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 55-hr-login.png | Login scherm met LAB\hr-user1 |
| 56-whoami.png | whoami /groups — hr-user1 lid van HR-Groep |
| 57-hr-toegang.png | HR map opent voor hr-user1 |
| 58-it-geblokkeerd.png | Toegang geweigerd bij IT map |
| 59-lastlogon.png | Get-ADUser LastLogonDate van hr-user1 |
