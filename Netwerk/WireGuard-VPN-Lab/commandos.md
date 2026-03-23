# WireGuard VPN — Gebruikte commando's

---

## Windows 10 Client

```powershell
# VPN verbinding testen
ping 10.0.0.1

# Route tabel bekijken
route print

# IP adressen bekijken
ipconfig /all

# VPN interface controleren
Get-NetAdapter | Where-Object {$_.InterfaceDescription -like "*WireGuard*"}

# DNS controleren
Resolve-DnsName google.com
```

---

## WireGuard client configuratie

```ini
[Interface]
PrivateKey = <automatisch gegenereerd>
Address = 10.0.0.2/24
DNS = 10.0.0.1

[Peer]
PublicKey = <pfSense public key>
Endpoint = 192.168.200.1:51820
AllowedIPs = 10.0.0.0/24
PersistentKeepalive = 25
```

---

## pfSense WireGuard paden

| Functie | Pad |
|---|---|
| WireGuard installeren | System → Package Manager → Available Packages |
| Tunnel aanmaken | VPN → WireGuard → Tunnels |
| Peer toevoegen | VPN → WireGuard → Peers |
| Status bekijken | VPN → WireGuard → Status |
| Firewall regel | Firewall → Rules → WAN |

---

## pfSense firewall regels voor WireGuard

**WAN regel — VPN verkeer toestaan:**
- Action: Pass
- Protocol: UDP
- Destination: WAN address
- Port: 51820

**WireGuard regel — ping toestaan:**
- Action: Pass
- Protocol: ICMP
- Source: Any
- Destination: Any

---

## WireGuard poorten

| Protocol | Poort | Gebruik |
|---|---|---|
| UDP | 51820 | WireGuard standaard poort |

---

## Troubleshooting

```powershell
# Als VPN niet verbindt — controleer firewall
Test-NetConnection -ComputerName 192.168.200.1 -Port 51820

# Als ping niet werkt — controleer route
route print | findstr "10.0.0"

# WireGuard logs bekijken op Windows
# Open WireGuard app → klik op Log
```
