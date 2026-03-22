# File Server Lab — Setup

Stap voor stap uitleg van hoe ik de File Server lab heb uitgevoerd.

---

## Stap 1 — Mappen aanmaken

```powershell
New-Item -Path "C:\Shares\HR" -ItemType Directory
New-Item -Path "C:\Shares\IT" -ItemType Directory
New-Item -Path "C:\Shares\Management" -ItemType Directory
New-Item -Path "C:\Shares\Finance" -ItemType Directory
New-Item -Path "C:\Shares\Sales" -ItemType Directory
```

---

## Stap 2 — Mappen delen via SMB

```powershell
New-SmbShare -Name "HR" -Path "C:\Shares\HR" -Description "HR Afdeling"
New-SmbShare -Name "IT" -Path "C:\Shares\IT" -Description "IT Afdeling"
New-SmbShare -Name "Management" -Path "C:\Shares\Management" -Description "Management Afdeling"
New-SmbShare -Name "Finance" -Path "C:\Shares\Finance" -Description "Finance Afdeling"
New-SmbShare -Name "Sales" -Path "C:\Shares\Sales" -Description "Sales Afdeling"
```

Controleren:

```powershell
Get-SmbShare
```

---

## Stap 3 — Security groepen aanmaken

```powershell
New-ADGroup -Name "HR-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "IT-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Management-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Finance-Groep" -GroupScope Global -GroupCategory Security
New-ADGroup -Name "Sales-Groep" -GroupScope Global -GroupCategory Security
```

---

## Stap 4 — 20 gebruikers aanmaken via PowerShell script

```powershell
$gebruikers = @(
  @{Naam="hr-user1";    Groep="HR-Groep"},
  @{Naam="hr-user2";    Groep="HR-Groep"},
  @{Naam="hr-user3";    Groep="HR-Groep"},
  @{Naam="hr-user4";    Groep="HR-Groep"},
  @{Naam="it-user1";    Groep="IT-Groep"},
  @{Naam="it-user2";    Groep="IT-Groep"},
  @{Naam="it-user3";    Groep="IT-Groep"},
  @{Naam="it-user4";    Groep="IT-Groep"},
  @{Naam="mgmt-user1";  Groep="Management-Groep"},
  @{Naam="mgmt-user2";  Groep="Management-Groep"},
  @{Naam="mgmt-user3";  Groep="Management-Groep"},
  @{Naam="mgmt-user4";  Groep="Management-Groep"},
  @{Naam="fin-user1";   Groep="Finance-Groep"},
  @{Naam="fin-user2";   Groep="Finance-Groep"},
  @{Naam="fin-user3";   Groep="Finance-Groep"},
  @{Naam="fin-user4";   Groep="Finance-Groep"},
  @{Naam="sales-user1"; Groep="Sales-Groep"},
  @{Naam="sales-user2"; Groep="Sales-Groep"},
  @{Naam="sales-user3"; Groep="Sales-Groep"},
  @{Naam="sales-user4"; Groep="Sales-Groep"}
)

foreach ($user in $gebruikers) {
  New-ADUser `
    -Name $user.Naam `
    -UserPrincipalName "$($user.Naam)@lab.local" `
    -AccountPassword (ConvertTo-SecureString "Welkom@123" -AsPlainText -Force) `
    -Enabled $true
  Add-ADGroupMember -Identity $user.Groep -Members $user.Naam
  Write-Host "Aangemaakt: $($user.Naam) --> $($user.Groep)" -ForegroundColor Green
}
```

---

## Stap 5 — NTFS Permissions instellen

```powershell
$afdelingen = @(
  @{Map="C:\Shares\HR";         Groep="LAB\HR-Groep"},
  @{Map="C:\Shares\IT";         Groep="LAB\IT-Groep"},
  @{Map="C:\Shares\Management"; Groep="LAB\Management-Groep"},
  @{Map="C:\Shares\Finance";    Groep="LAB\Finance-Groep"},
  @{Map="C:\Shares\Sales";      Groep="LAB\Sales-Groep"}
)

foreach ($afd in $afdelingen) {
  $acl = Get-Acl $afd.Map
  $rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $afd.Groep, "FullControl",
    "ContainerInherit,ObjectInherit", "None", "Allow")
  $acl.SetAccessRule($rule)
  Set-Acl $afd.Map $acl
  Write-Host "Permissions ingesteld voor: $($afd.Map)" -ForegroundColor Green
}
```

---

## Stap 6 — Toegang testen vanuit client

Op Windows 10 VM via Verkenner:

```
\\192.168.100.10\HR
\\192.168.100.10\IT
\\192.168.100.10\Management
\\192.168.100.10\Finance
\\192.168.100.10\Sales
```

Ingelogd als hr-user1 — alleen toegang tot HR map.

---

## Wat ik heb geleerd

- Hoe SMB shares werken op Windows Server
- Hoe NTFS permissions werken en het verschil met share permissions
- Hoe je security groepen gebruikt voor toegangsbeheer
- Hoe je bulk gebruikers aanmaakt via PowerShell
- Hoe je toegang test vanuit een domein client
