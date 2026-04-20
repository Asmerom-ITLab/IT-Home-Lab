# Domain Users Lab

Domein gebruikers getest op Windows 10 en Windows 11 clients.
NTFS permissions gecontroleerd en gecorrigeerd per afdeling.
Bewijs dat Active Directory gebruikersbeheer correct werkt.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| Domein | lab.local |
| Clients | Windows 10 en Windows 11 |
| Getest met | hr-user1, it-user1 |

---

## Wat ik heb gedaan

- Ingelogd op Windows 10 als LAB\hr-user1
- Groepslidmaatschap gecontroleerd via whoami /groups
- File Share toegang getest voor alle 5 mappen
- NTFS permissions gecorrigeerd via Advanced Security Settings
- Everyone en Users verwijderd van alle mappen
- Alleen juiste groep toegang gegeven per map
- SMB share permissions ingesteld via Server Manager
- Toegang opnieuw getest — hr-user1 heeft alleen toegang tot HR map
- LastLogonDate gecontroleerd via Get-ADUser

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
- Hoe NTFS permissions werken samen met AD groepen
- Het verschil tussen SMB en NTFS permissions
- Hoe je permissions corrigeert via Advanced Security Settings
- Hoe je toegang test vanuit een domein gebruiker

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 55-hr-login.png | Login met LAB\hr-user1 |
| 56-whoami.png | whoami /groups — HR-Groep zichtbaar |
| 57-hr-toegang.png | HR map opent voor hr-user1 |
| 58-it-geblokkeerd.png | Toegang geweigerd bij IT map |
| 59-lastlogon.png | LastLogonDate van hr-user1 |
