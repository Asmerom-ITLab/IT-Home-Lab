
# PowerShell Scripts

Automatiseringsscripts geschreven voor het beheren van een Windows Server 2025 
omgeving met Active Directory.

---

## Scripts

### systeem-rapport.ps1
Genereert een volledig systeem rapport van de server.

**Wat het laat zien:**
- CPU naam, gebruik en aantal cores
- RAM totaal, gebruikt en vrij
- Schijfruimte van alle drives
- Active Directory gebruikers statistieken
- Status van belangrijke services

**Hoe uitvoeren:**
```powershell
.\systeem-rapport.ps1
```

**Voorbeeld output:**
```
===== SYSTEEM RAPPORT =====
Server: DC01
Datum: 19-03-2026 14:30

--- CPU ---
Naam: Intel(R) Core(TM) i7
Gebruik: 12 procent
Cores: 8

--- RAM ---
Totaal: 8 GB
Gebruikt: 3.2 GB
Vrij: 4.8 GB

--- ACTIVE DIRECTORY ---
Totaal gebruikers: 22
Actief: 20
Inactief: 2
```

---

### inactieve-gebruikers.ps1
Zoekt gebruikers die 30 dagen of langer niet hebben ingelogd 
en schakelt ze uit na bevestiging.

**Wat het doet:**
- Zoekt alle actieve gebruikers in Active Directory
- Controleert wanneer ze voor het laatst hebben ingelogd
- Toont een lijst van inactieve gebruikers
- Vraagt bevestiging voordat gebruikers worden uitgeschakeld

**Hoe uitvoeren:**
```powershell
.\inactieve-gebruikers.ps1
```

**Voorbeeld output:**
```
===== INACTIEVE GEBRUIKERS =====
Niet ingelogd sinds: 17-02-2026

Gevonden inactieve gebruikers:
  hr-user1 - Laatste login: Nooit ingelogd
  fin-user2 - Laatste login: 01-02-2026

Totaal inactief: 2
Wil je deze gebruikers uitschakelen? (ja/nee):
```

---

## Omgeving

| Onderdeel | Details |
|-----------|---------|
| Server | Windows Server 2025 |
| PowerShell | versie 5.1+ |
| Domein | lab.local |
| Rechten | Administrator vereist |

---

## Hoe scripts uitvoeren

1. Open PowerShell als Administrator op de server
2. Navigeer naar de scripts map:
```powershell
cd C:\Scripts
```
3. Voer het script uit:
```powershell
.\systeem-rapport.ps1
.\inactieve-gebruikers.ps1
```

---

## Wat ik heb geleerd

- PowerShell scripting voor Windows Server beheer
- Active Directory beheer via PowerShell
- Systeem monitoring via WMI objecten
- Automatisering van repetitieve sysadmin taken