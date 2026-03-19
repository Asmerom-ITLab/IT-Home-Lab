# Netwerk Architectuur

Gedetailleerde beschrijving van de netwerk architectuur van het IT Home Lab.

---

## Netwerk type

VMware Workstation NAT netwerk — VMnet8

NAT betekent dat alle virtuele machines internettoegang hebben via
de host pc, maar in een eigen beveiligd subnet zitten. Dit simuleert
een bedrijfsnetwerk achter een router.

---

## Subnet informatie

| Instelling | Waarde |
|---|---|
| Netwerk adres | 192.168.100.0 |
| Subnetmask | 255.255.255.0 |
| CIDR notatie | 192.168.100.0/24 |
| Gateway | 192.168.100.2 |
| Broadcast | 192.168.100.255 |
| Beschikbare adressen | 192.168.100.1 — 192.168.100.254 |

---

## IP adres toewijzing

| Machine | IP adres | Methode |
|---|---|---|
| VMware NAT Gateway | 192.168.100.2 | Vast — VMware |
| Windows Server DC01 | 192.168.100.10 | Statisch |
| Ubuntu Server | 192.168.100.20 | Statisch |
| Windows 10 Client | 192.168.100.12 | DHCP |
| Windows 11 Client | 192.168.100.13 | DHCP |
| DHCP bereik clients | 192.168.100.50 — 192.168.100.150 | DHCP scope |

---

## DHCP configuratie

DHCP server draait op Windows Server DC01.

| Instelling | Waarde |
|---|---|
| DHCP server | 192.168.100.10 |
| Scope naam | Lab Netwerk |
| Start adres | 192.168.100.50 |
| Eind adres | 192.168.100.150 |
| Subnetmask | 255.255.255.0 |
| Gateway voor clients | 192.168.100.2 |
| DNS voor clients | 192.168.100.10 |
| DNS domein | lab.local |

---

## DNS configuratie

DNS server draait op Windows Server DC01 als onderdeel van
Active Directory.

| Instelling | Waarde |
|---|---|
| DNS server | 192.168.100.10 |
| Domein | lab.local |
| Forward lookup zone | lab.local |
| DC01 A record | 192.168.100.10 |

---

## Firewall regels Ubuntu Server

| Poort | Protocol | Service | Status |
|---|---|---|---|
| 22 | TCP | SSH | Toegestaan |
| 80 | TCP | Apache HTTP | Toegestaan |
| 10050 | TCP | Zabbix Agent | Toegestaan |

---

## Communicatie tussen machines

| Van | Naar | Protocol | Doel |
|---|---|---|---|
| Windows 10 | DC01 | TCP/UDP | Domain login, AD |
| Windows 11 | DC01 | TCP/UDP | Domain login, AD |
| Windows 10 | Ubuntu | TCP 22 | SSH verbinding |
| Windows 10 | Ubuntu | TCP 80 | Apache website |
| Ubuntu | DC01 | TCP/UDP | DNS queries |
| Zabbix server | DC01 | TCP 10050 | Monitoring |
| Zabbix server | Ubuntu | TCP 10050 | Monitoring |
| Alle machines | 8.8.8.8 | ICMP | Internet test |

---

## Netwerk diagram

```
                    INTERNET
                        |
              [VMware NAT 192.168.100.2]
                        |
            +-----------+-----------+
            |                       |
    [192.168.100.10]        [192.168.100.20]
    Windows Server DC01      Ubuntu Server
    AD | DNS | DHCP          Apache | SSH
    File Server              Zabbix Server
    Group Policy
    Backup
            |                       |
            +----------+------------+
                       |
            +----------+----------+
            |                     |
    [192.168.100.12]     [192.168.100.13]
    Windows 10 Client    Windows 11 Client
    Domain joined        Domain joined
```
