# pfSense Firewall Lab — Gebruikte commando's

---

## Windows 10 Client configuratie

```powershell
# IP adres controleren
ipconfig /all

# Ping naar pfSense LAN
ping 192.168.200.1

# Internet testen via pfSense
ping 8.8.8.8

# DNS testen
Resolve-DnsName google.com

# Route tabel bekijken
route print

# Netwerk adapter instellen
# Via ncpa.cpl (GUI) of PowerShell:
New-NetIPAddress -InterfaceAlias "Ethernet0" `
  -IPAddress 192.168.200.10 `
  -PrefixLength 24 `
  -DefaultGateway 192.168.200.1

Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" `
  -ServerAddresses 192.168.200.1
```

---

## pfSense console commando's

```bash
# pfSense herstart
pfSsh.php playback syslogd restart

# Interfaces bekijken
ifconfig

# Route tabel bekijken
netstat -rn

# DNS testen vanuit pfSense
host google.com

# pfSense versie bekijken
cat /etc/version
```

---

## pfSense web interface paden

| Functie | Pad |
|---|---|
| Dashboard | https://192.168.200.1 |
| Firewall regels | Firewall → Rules |
| DHCP server | Services → DHCP Server |
| DNS resolver | Services → DNS Resolver |
| Interfaces | Interfaces → Assignments |
| System logs | Status → System Logs |
| Updates | System → Update |

---

## Firewall regels beheren

Via pfSense web interface:

1. Ga naar **Firewall** → **Rules**
2. Klik op **LAN** tabblad
3. Klik op **Add** om nieuwe regel toe te voegen

Standaard regels op LAN:
- Allow LAN to any — alle LAN verkeer doorgelaten
- Anti-lockout rule — beheer altijd mogelijk

---

## DHCP leases bekijken

Via pfSense web interface:
1. Ga naar **Status** → **DHCP Leases**
2. Je ziet alle apparaten die een IP hebben gekregen van pfSense
