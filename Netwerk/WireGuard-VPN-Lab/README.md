# WireGuard VPN Lab

WireGuard VPN geconfigureerd op pfSense als VPN server.
Windows 10 client maakt veilig verbinding via VPN tunnel.

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| VPN Server | pfSense — 192.168.200.1 |
| VPN Port | UDP 51820 |
| VPN Subnet | 10.0.0.0/24 |
| Server IP | 10.0.0.1 |
| Client IP | 10.0.0.2 |
| Client | Windows 10 |

---

## Netwerk diagram

```
Windows 10 Client
[10.0.0.2]
    |
    | WireGuard VPN Tunnel
    | UDP 51820
    |
[pfSense WireGuard]
[10.0.0.1]
    |
[LAN — 192.168.200.0/24]
    |
[INTERNET]
```

---

## Wat ik heb gedaan

- WireGuard package geinstalleerd op pfSense
- pfSense bijgewerkt naar laatste versie
- WireGuard tunnel aangemaakt op pfSense
- Public en Private keys gegenereerd
- Peer aangemaakt voor Windows 10 client
- Firewall regel toegevoegd voor UDP poort 51820
- WireGuard client geinstalleerd op Windows 10
- VPN configuratie aangemaakt op Windows 10
- Public keys uitgewisseld tussen server en client
- VPN verbinding getest — handshake succesvol
- Ping naar VPN gateway getest

---

## WireGuard configuratie

**pfSense server:**

| Instelling | Waarde |
|---|---|
| Tunnel naam | Lab-VPN |
| Listen port | 51820 |
| Server IP | 10.0.0.1/24 |

**Windows 10 client:**

```ini
[Interface]
Address = 10.0.0.2/24
DNS = 10.0.0.1

[Peer]
PublicKey = <pfSense public key>
Endpoint = 192.168.200.1:51820
AllowedIPs = 10.0.0.0/24
PersistentKeepalive = 25
```

---

## Testresultaten

| Test | Resultaat |
|---|---|
| WireGuard handshake | Succesvol |
| Ping naar 10.0.0.1 | Werkt |
| Data transfer | 3.21 KiB ontvangen |
| VPN status | Active |

---

## Waarom WireGuard VPN belangrijk is

In een bedrijfsomgeving hebben medewerkers die thuis werken
een veilige verbinding nodig naar het bedrijfsnetwerk.
WireGuard is:
- Sneller dan OpenVPN
- Eenvoudiger te configureren
- Moderner en veiliger
- Ingebouwd in Linux kernel

---

## Wat ik heb geleerd

- Hoe WireGuard VPN werkt
- Hoe je public en private keys aanmaakt
- Hoe je een VPN tunnel configureert op pfSense
- Hoe je een VPN client instelt op Windows
- Hoe je firewall regels maakt voor VPN verkeer
- Het belang van VPN in een bedrijfsomgeving

---

## Screenshots

Zie de `screenshots/` map voor bewijs van elke stap.

| Screenshot | Wat je ziet |
|---|---|
| 109-wireguard-install.png | WireGuard installatie op pfSense |
| 110-wireguard-tunnel.png | WireGuard tunnel aangemaakt |
| 111-wireguard-peer.png | Peer configuratie met public key |
| 112-wireguard-connected.png | VPN status Active met handshake |
| 113-wireguard-ping.png | Ping naar 10.0.0.1 succesvol |
