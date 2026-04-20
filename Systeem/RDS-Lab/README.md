# Remote Desktop Services Lab

Remote Desktop Services geconfigureerd op Windows Server 2025.
Gebruikers kunnen via Remote Desktop verbinding maken met DC01
vanuit Windows 10 en Windows 11 clients.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| RDP poort | 3389 |
| Clients | Windows 10 en Windows 11 |
| Toegang via | LAB\hr-user1 en andere domein gebruikers |

---

## Geinstalleerde RDS rollen

| Rol | Functie |
|---|---|
| RDS-RD-Server | Remote Desktop Session Host |
| RDS-Connection-Broker | Verbindingen beheren |
| RDS-Web-Access | Web toegang tot Remote Desktop |

---

## Wat ik heb gedaan

- RDS rollen geinstalleerd op DC01 via PowerShell
- Domain Users groep toegevoegd aan Remote Desktop Users
- Session Collection aangemaakt via Server Manager
- Firewall regel ingeschakeld voor RDP poort 3389
- GPO aangemaakt voor Remote Desktop toegang
- RDP verbinding getest vanaf Windows 10 client
- Actieve sessies gecontroleerd via query session

---

## Testresultaten

| Test | Resultaat |
|---|---|
| RDP verbinding vanaf Windows 10 | Werkt |
| Login met hr-user1 | Werkt |
| Sessie zichtbaar via query session | Werkt |
| Firewall regel actief | Werkt |

---

## Waarom RDS belangrijk is

In een bedrijfsomgeving werken veel medewerkers op afstand via
Remote Desktop. RDS maakt het mogelijk om centraal applicaties
te beheren en gebruikers veilig toegang te geven.

---

## Wat ik heb geleerd

- Hoe Remote Desktop Services werkt op Windows Server
- Hoe je gebruikers toegang geeft via RDP
- Hoe je een Session Collection aanmaakt
- Hoe je actieve RDP sessies controleert
- Het belang van RDS voor thuiswerkers

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 141-rds-role.png | RDS rol geinstalleerd op DC01 |
| 142-rds-collection.png | Session Collection aangemaakt |
| 143-rds-gpo.png | GPO voor Remote Desktop toegang |
| 144-rds-client.png | RDP verbinding actief vanaf Windows 10 |
| 145-rds-users.png | Actieve sessies via query session |
