# Active Directory Lab

Windows Server 2025 ingericht als Domain Controller met Active Directory,
DNS en DHCP in een VMware Workstation omgeving.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Hypervisor | VMware Workstation |
| Server OS | Windows Server 2025 |
| Server naam | DC01 |
| IP adres | 192.168.100.10 |
| Domein | lab.local |
| NetBIOS naam | LAB |
| Netwerk | VMware NAT — 192.168.100.0/24 |

---

## Wat ik heb gedaan

- VMware NAT netwerk geconfigureerd op 192.168.100.0/24
- Windows Server 2025 VM aangemaakt en gekoppeld aan VMnet8
- Statisch IP ingesteld op 192.168.100.10
- Server hernoemd naar DC01
- Active Directory Domain Services rol geinstalleerd
- Active Directory forest aangemaakt — lab.local
- DNS server geconfigureerd en getest
- DHCP server geinstalleerd en scope aangemaakt
- Windows 10 en Windows 11 clients gejoined aan het domein
- 20 gebruikers aangemaakt in 5 afdelingen
- 5 security groepen aangemaakt per afdeling

---

## Resultaat

Na deze lab is de volgende infrastructuur operationeel:

- Domain Controller DC01 op 192.168.100.10
- Active Directory domein lab.local
- DNS server — lab.local resolvet naar 192.168.100.10
- DHCP scope 192.168.100.50 tot 192.168.100.150
- Windows 10 client gejoined aan lab.local
- Windows 11 client gejoined aan lab.local
- 20 gebruikers verdeeld over HR, IT, Management, Finance en Sales

---

## Vaardigheden

- Active Directory Domain Services (AD DS)
- DNS configuratie en beheer
- DHCP server configuratie
- Domain Controller setup
- PowerShell voor server beheer
- VMware netwerk configuratie
- Windows Server 2025

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 00-network-editor.png | VMware Virtual Network Editor |
| 01-vmnet8-config.png | NAT netwerk instellingen |
| 02-vm-adapter.png | VM gekoppeld aan VMnet8 |
| 03-static-ip.png | Statisch IP ingesteld |
| 04-adds-role.png | AD DS rol geinstalleerd |
| 05-forest-install.png | Forest aangemaakt |
| 06-login-screen.png | Login met LAB\Administrator |
| 07-addomain.png | Get-ADDomain output |
| 08-aduc.png | Active Directory Users and Computers |
| 09-dns-check.png | DNS werkt correct |
