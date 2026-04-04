# Remote Desktop Services Lab

Remote Desktop Services geconfigureerd op Windows Server 2025.
Gebruikers kunnen via Remote Desktop verbinding maken met DC01
vanuit Windows 10 en Windows 11 clients.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| RDP Poort | 3389 |
| Clients | Windows 10 en Windows 11 |

---

## Wat ik heb gedaan

- RDS rollen geinstalleerd op DC01
- Remote Desktop Users groep geconfigureerd
- Domein gebruikers toegevoegd aan Remote Desktop Users
- Session Collection aangemaakt via Server Manager
- Firewall regel ingeschakeld voor RDP
- GPO aangemaakt voor Remote Desktop toegang
- RDP verbinding getest vanaf Windows 10 client
- Actieve sessies gecontroleerd via query session

---

## RDS rollen geinstalleerd

| Rol | Functie |
|---|---|
| RDS-RD-Server | Remote Desktop Session Host |
| RDS-Connection-Broker | Verbindingen beheren |
| RDS-Web-Access | Web toegang tot Remote Desktop |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| RDP verbinding vanaf Windows 10 | Werkt |
| Login met hr-user1 | Werkt |
| Sessie zichtbaar via query session | Werkt |
| Firewall regel actief | Werkt |

---

## Wat ik heb geleerd

- Hoe Remote Desktop Services werkt op Windows Server
- Hoe je gebruikers toegang geeft via RDP
- Hoe je een Session Collection aanmaakt
- Hoe je actieve RDP sessies controleert
- Het belang van RDS in een bedrijfsomgeving voor thuiswerkers

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 141-rds-role.png | RDS rol geinstalleerd op DC01 |
| 142-rds-collection.png | Session Collection aangemaakt |
| 143-rds-gpo.png | GPO voor Remote Desktop toegang |
| 144-rds-client.png | RDP verbinding actief vanaf Windows 10 |
| 145-rds-users.png | Actieve sessies via query session |
