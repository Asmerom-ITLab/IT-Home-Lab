# Group Policy Lab — Setup

Stap voor stap uitleg van hoe ik de Group Policy lab heb uitgevoerd.

---

## Stap 1 — Group Policy Management Console openen

```powershell
gpmc.msc
```

De Group Policy Management Console opent. Hier beheer je alle
Group Policy Objects voor het domein lab.local.

---

## Stap 2 — Wachtwoordbeleid GPO aanmaken

```powershell
New-GPO -Name "Wachtwoordbeleid" -Comment "Wachtwoord vereisten voor alle gebruikers"
New-GPLink -Name "Wachtwoordbeleid" -Target "DC=lab,DC=local"
```

Via GPMC heb ik daarna het wachtwoordbeleid geconfigureerd:
- Computer Configuration → Policies → Windows Settings →
  Security Settings → Account Policies → Password Policy

Instellingen:
- Minimum password length: 8 tekens
- Maximum password age: 90 dagen
- Password complexity: Enabled

---

## Stap 3 — Bureaubladbeleid GPO aanmaken

```powershell
New-GPO -Name "Bureaubladbeleid" -Comment "Vaste achtergrond voor alle gebruikers"
New-GPLink -Name "Bureaubladbeleid" -Target "DC=lab,DC=local"
```

Achtergrond ingesteld via registry:

```powershell
Set-GPRegistryValue -Name "Bureaubladbeleid" `
  -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
  -ValueName "Wallpaper" `
  -Type String `
  -Value "C:\Windows\Web\Wallpaper\Windows\img0.jpg"
```

---

## Stap 4 — USB blokkeren GPO aanmaken

```powershell
New-GPO -Name "USB-Blokkeren" -Comment "Blokkeert USB opslag apparaten"
New-GPLink -Name "USB-Blokkeren" -Target "DC=lab,DC=local"

Set-GPRegistryValue -Name "USB-Blokkeren" `
  -Key "HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR" `
  -ValueName "Start" `
  -Type DWord `
  -Value 4
```

---

## Stap 5 — GPOs controleren

```powershell
Get-GPO -All | Select-Object DisplayName, GpoStatus
```

Alle drie de GPOs tonen AllSettingsEnabled.

---

## Stap 6 — GPO toepassen op clients

Op Windows 10 en Windows 11 VM:

```powershell
gpupdate /force
```

---

## Stap 7 — GPO toepassing controleren

```powershell
gpresult /r
```

Alle drie de GPOs zijn zichtbaar onder Applied Group Policy Objects.

---

## Wat ik heb geleerd

- Hoe Group Policy Objects werken in Active Directory
- Hoe je GPOs aanmaakt en koppelt aan een domein
- Hoe je registry waarden instelt via GPO
- Hoe je controleert welke GPOs zijn toegepast op een client
- Hoe je wachtwoordbeleid instelt via GPO
- Hoe je USB opslag blokkeert via GPO
