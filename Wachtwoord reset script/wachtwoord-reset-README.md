# Wachtwoord Reset Script

PowerShell script voor het resetten van Active Directory
gebruikerswachtwoorden met verplichte wachtwoordwijziging
bij de volgende login.

---

## Gebruik

```powershell
cd C:\Scripts
.\wachtwoord-reset.ps1
```

---

## Wat het script doet

1. Vraagt om de gebruikersnaam
2. Controleert of de gebruiker bestaat in Active Directory
3. Stelt een nieuw tijdelijk wachtwoord in
4. Verplicht de gebruiker een nieuw wachtwoord in te stellen bij de volgende login
5. Toont een bevestiging

---

## Script code

```powershell
# ============================================
# Wachtwoord Reset Script
# ============================================

Write-Host "===== WACHTWOORD RESET =====" -ForegroundColor Cyan
Write-Host ""

$gebruiker = Read-Host "Voer de gebruikersnaam in (bijv. hr-user1)"

$adUser = Get-ADUser -Identity $gebruiker -ErrorAction SilentlyContinue

if ($adUser -eq $null) {
    Write-Host "Gebruiker '$gebruiker' niet gevonden!" -ForegroundColor Red
    exit
}

Write-Host "Gebruiker gevonden: $($adUser.Name)" -ForegroundColor Green

$nieuwWachtwoord = Read-Host "Voer het nieuwe tijdelijke wachtwoord in" -AsSecureString

Set-ADAccountPassword -Identity $gebruiker -NewPassword $nieuwWachtwoord -Reset
Set-ADUser -Identity $gebruiker -ChangePasswordAtLogon $true

Write-Host "Wachtwoord succesvol gereset voor: $($adUser.Name)" -ForegroundColor Green
Write-Host "Gebruiker moet wachtwoord wijzigen bij volgende login." -ForegroundColor Yellow
Write-Host "===== KLAAR =====" -ForegroundColor Cyan
```

---

## Screenshots

### 1 — Script uitvoeren
![Script output](screenshots/60-wachtwoord-reset.png)

Output van het wachtwoord reset script na uitvoeren.
Toont bevestiging dat het wachtwoord is gereset voor hr-user1.

---

### 2 — Nieuw wachtwoord vereist op client
![Nieuw wachtwoord](screenshots/61-nieuw-wachtwoord.png)

Windows vraagt automatisch om een nieuw wachtwoord bij de
volgende login van hr-user1. Dit bewijst dat de instelling
ChangePasswordAtLogon correct werkt.

---

## Vereisten

- PowerShell als Administrator uitvoeren
- Active Directory module beschikbaar
- Domein Administrator rechten

---

## Wat ik heb geleerd

- Hoe je AD wachtwoorden reset via PowerShell
- Hoe je gebruikers verplicht een nieuw wachtwoord in te stellen
- Hoe je gebruikersinvoer verwerkt in PowerShell
- Hoe je foutafhandeling toepast bij niet bestaande gebruikers
