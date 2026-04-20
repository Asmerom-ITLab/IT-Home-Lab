# Active Directory Lab

Windows Server 2025 ingericht als Domain Controller voor het lab.local domein.
Active Directory, DNS en DHCP zijn geconfigureerd. Er zijn 20 gebruikers
aangemaakt verdeeld over 5 afdelingen.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| Server | DC01 — Windows Server 2025 |
| IP adres | 192.168.50.10 |
| Domein | lab.local |
| NetBIOS | LAB |
| DNS | 192.168.50.10 |
| DHCP scope | 192.168.50.100 — 192.168.50.200 |

---

## Wat ik heb gedaan

- Windows Server 2025 geinstalleerd op DC01
- Statisch IP adres ingesteld op 192.168.50.10
- AD DS rol geinstalleerd via PowerShell
- Nieuw forest aangemaakt — lab.local
- DNS geconfigureerd als onderdeel van AD DS
- DHCP rol geinstalleerd en geconfigureerd
- DHCP scope aangemaakt voor 192.168.50.0/24
- 5 Organizational Units aangemaakt per afdeling
- 5 security groepen aangemaakt
- 20 gebruikers aangemaakt verdeeld over 5 afdelingen
- Windows 10 en Windows 11 clients gejoined aan domein

---

## Gebruikers en groepen

| Afdeling | Groep | Gebruikers |
|---|---|---|
| HR | HR-Groep | hr-user1 t/m hr-user4 |
| IT | IT-Groep | it-user1 t/m it-user4 |
| Management | Management-Groep | mgmt-user1 t/m mgmt-user4 |
| Finance | Finance-Groep | fin-user1 t/m fin-user4 |
| Sales | Sales-Groep | sales-user1 t/m sales-user4 |

Wachtwoord voor alle gebruikers: `Welkom@123`

---

## DHCP configuratie

| Instelling | Waarde |
|---|---|
| Scope naam | Lab Scope |
| Start adres | 192.168.50.100 |
| Eind adres | 192.168.50.200 |
| Gateway | 192.168.50.1 |
| DNS server | 192.168.50.10 |
| Domein | lab.local |

---

## Testresultaten

| Test | Resultaat |
|---|---|
| AD DS geinstalleerd | Werkt |
| DNS werkt correct | Werkt |
| DHCP geeft IP uit | Werkt |
| Windows 10 gejoined | Werkt |
| Windows 11 gejoined | Werkt |
| Gebruikers kunnen inloggen | Werkt |

---

## Wat ik heb geleerd

- Hoe Active Directory Domain Services werkt
- Hoe je een nieuw forest aanmaakt
- Hoe DNS samenwerkt met Active Directory
- Hoe je DHCP configureert voor een domein netwerk
- Hoe je gebruikers en groepen beheert via PowerShell
- Hoe je clients joined aan een domein

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 04-adds-role.png | AD DS rol geinstalleerd |
| 05-forest-install.png | Forest lab.local aangemaakt |
| 06-login-screen.png | Login met LAB\Administrator |
| 07-addomain.png | Get-ADDomain output |
| 08-aduc.png | Active Directory Users and Computers |
| 09-dns-check.png | DNS werkt correct |
