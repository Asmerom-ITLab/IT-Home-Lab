# WireGuard VPN Lab

WireGuard VPN geconfigureerd op pfSense als VPN server.
Alle apparaten in het lab zijn verbonden via een VPN tunnel.
Dit simuleert veilig werken op afstand.

---

## Omgeving

| Onderdeel | Details |
|---|---|
| VPN Server | pfSense — poort 51820 UDP |
| VPN Subnet | 10.0.0.0/24 |
| Server VPN IP | 10.0.0.1 |

---

## VPN clients

| Apparaat | VPN IP | Status |
|---|---|---|
| DC01 | 10.0.0.2 | Actief |
| DC02 | 10.0.0.3 | Actief |
| Ubuntu | 10.0.0.4 | Actief |
| Windows 10 | 10.0.0.5 | Actief |
| Windows 11 | 10.0.0.6 | Actief |

---

## Wat ik heb gedaan

- WireGuard package geinstalleerd op pfSense
- VPN tunnel aangemaakt — Lab-VPN
- Public en private keys gegenereerd
- Peers aangemaakt voor alle apparaten
- Firewall regel toegevoegd voor UDP 51820
- WireGuard client geinstalleerd op alle Windows apparaten
- WireGuard geinstalleerd op Ubuntu via apt
- VPN configuratie aangemaakt op alle apparaten
- Public keys uitgewisseld tussen server en clients
- VPN verbinding getest — handshake succesvol

---

## WireGuard client configuratie

```ini
[Interface]
Address = 10.0.0.x/24
DNS = 192.168.50.10

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
| Alle clients actief | Werkt |
| Data transfer | Werkt |

---

## Waarom WireGuard

WireGuard is moderner en sneller dan OpenVPN. Het wordt gebruikt
in bedrijven voor veilige verbindingen voor thuiswerkers.

---

## Wat ik heb geleerd

- Hoe WireGuard VPN werkt
- Hoe public en private keys werken
- Hoe je een VPN tunnel configureert
- Hoe je meerdere clients verbindt via VPN
- Het belang van VPN voor veilig werken op afstand

---

## Screenshots

| Screenshot | Wat je ziet |
|---|---|
| 109-wireguard-install.png | WireGuard geinstalleerd op pfSense |
| 110-wireguard-tunnel.png | VPN tunnel aangemaakt |
| 111-wireguard-peer.png | Peers geconfigureerd |
| 112-wireguard-connected.png | VPN actief met handshake |
| 113-wireguard-ping.png | Ping naar 10.0.0.1 werkt |
| 132-wireguard-alle-peers.png | Alle 5 peers in pfSense |
| 138-wireguard-ubuntu.png | WireGuard actief op Ubuntu |
