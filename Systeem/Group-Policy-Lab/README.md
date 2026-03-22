# Group Policy Lab

Group Policy Objects (GPO) geconfigureerd in een Active Directory
omgeving op Windows Server 2025.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 — DC01 |
| Domein | lab.local |
| Clients | Windows 10 en Windows 11 |
| Tool | Group Policy Management Console (GPMC) |

---

## Wat ik heb gedaan

- Group Policy Management Console geopend via gpmc.msc
- Wachtwoordbeleid GPO aangemaakt en gekoppeld aan lab.local
- Bureaubladbeleid GPO aangemaakt met vaste achtergrond
- USB blokkeren GPO aangemaakt
- Alle GPOs gekoppeld aan het domein
- gpupdate /force uitgevoerd op clients
- GPO toepassing gecontroleerd via gpresult /r

---

## GPOs aangemaakt

| GPO naam | Wat het doet |
|---|---|
| Wachtwoordbeleid | Wachtwoord vereisten instellen |
| Bureaubladbeleid | Vaste achtergrond voor alle gebruikers |
| USB-Blokkeren | USB opslag apparaten blokkeren |

---

## Resultaat

Alle drie de GPOs zijn succesvol aangemaakt, gekoppeld aan lab.local
en toegepast op de Windows 10 en Windows 11 clients.

---

## Vaardigheden

- Group Policy Objects aanmaken en beheren
- GPO koppelen aan een Active Directory domein
- Registry waarden instellen via GPO
- GPO toepassing controleren via gpresult
- Domain security beheer
- GPMC gebruiken

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 39-gpo-lijst.png | Get-GPO output met alle GPOs |
| 40-gpmc.png | GPMC venster met GPOs |
| 41-gpupdate.png | gpupdate /force output |
| 42-gpresult.png | gpresult /r output |
