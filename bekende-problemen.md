# Bekende Problemen en Oplossingen

Eerlijke documentatie van technische problemen die zijn
tegengekomen tijdens het bouwen van het home lab.
Het documenteren van problemen laat zien dat je problemen
kunt analyseren en realistisch kunt rapporteren.

---

## Probleem 1 — Ubuntu Server geen internet via pfSense

| Onderdeel | Details |
|---|---|
| Machine | Ubuntu Server 192.168.50.20 |
| Probleem | Geen internet verbinding via pfSense |
| Status | Bekend probleem — gedocumenteerd |

**Symptomen:**
- Ping naar 192.168.50.1 — 100% packet loss
- Ping naar 8.8.8.8 — 100% packet loss
- Ubuntu krijgt wel DHCP IP via pfSense reservering
- Zabbix en Apache draaien correct op intern netwerk

**Oorzaak:**
Ubuntu's netwerkpakketjes komen niet aan op pfSense em2 interface.
tcpdump op pfSense em2 toont geen verkeer van 192.168.50.20.
Dit is een VMware VMnet3 compatibiliteitsprobleem.

**Wat geprobeerd:**
- Statisch IP verwijderd en DHCP ingesteld
- Overbodige netplan bestanden verwijderd
- Nieuw MAC adres gegenereerd
- Tweede netwerk adapter toegevoegd op VMnet3
- NAT outbound regel toegevoegd voor 192.168.50.0/24
- Firewall regel toegevoegd voor INTERN interface

**Wat wel werkt:**
- Zabbix monitoring draait correct
- Apache webserver bereikbaar via intern netwerk
- SSH verbinding werkt via intern netwerk
- DC01, DC02, Windows 10 en Windows 11 hebben wel internet

**Toekomstig plan:**
- Ubuntu opnieuw installeren als nieuwe VM
- Direct op VMnet3 installeren zonder migratie

---

## Probleem 2 — WSUS SQL timeout

| Onderdeel | Details |
|---|---|
| Machine | DC01 Windows Server 2025 |
| Probleem | WSUS postinstall SQL timeout |
| Status | Opgelost door alternatief te kiezen |

**Symptomen:**
```
Fatal Error: Failed to start and configure the WSUS service
ImportDefaultDetectoids failed — Execution Timeout Expired
```

**Oorzaak:**
Windows Internal Database timeout bij het importeren van
detectoids. VM had te weinig RAM (4GB) voor WSUS.

**Oplossing:**
Windows Update via Group Policy geconfigureerd als alternatief.
Dit geeft dezelfde functionaliteit zonder WSUS server.

---

## Probleem 3 — Snort IDS/IPS compatibiliteit

| Onderdeel | Details |
|---|---|
| Machine | pfSense 2.7.0 |
| Probleem | Snort kan niet starten |
| Status | Bekend probleem met pfSense 2.7.0 |

**Symptomen:**
```
ld-elf.so.1: Shared object "libcrypto.so.30" not found,
required by "snort"
```

**Oorzaak:**
Snort vereist libcrypto.so.30 maar pfSense 2.7.0 heeft
een incompatibele versie geinstalleerd.

**Toekomstig plan:**
- Wachten op pfSense update met compatibele libraries
- Suricata proberen als alternatief

---

## Probleem 4 — DC02 promotie via kloon mislukt

| Onderdeel | Details |
|---|---|
| Machine | DC02 Windows Server 2025 |
| Probleem | AD database conflict na klonen van DC01 |
| Status | Opgelost |

**Symptomen:**
```
The Directory Server detected that the database has errors
NTDS service cannot start
```

**Oorzaak:**
DC02 was een kloon van DC01 — de AD database had conflicten
omdat beide servers dezelfde database hadden.

**Oplossing:**
DC02 opnieuw geinstalleerd vanuit Windows Server 2025 ISO
en daarna gepromoveerd als nieuwe Domain Controller.

---

## Wat ik heb geleerd van deze problemen

- Klonen van een Domain Controller werkt niet — altijd schone installatie
- WSUS heeft minimaal 6GB RAM nodig op een VM
- Snort is niet compatibel met pfSense 2.7.0
- VMware VMnet adapters kunnen soms niet correct communiceren
- Eerlijk documenteren van problemen is professioneler dan verbergen
