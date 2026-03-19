# Domain Users Lab — Gebruikte commando's

---

## Gebruiker info controleren

```powershell
# Wie ben ik ingelogd als
whoami

# Groepen van huidige gebruiker
whoami /groups

# Gebruiker info in AD bekijken
Get-ADUser -Identity "hr-user1" -Properties *

# Laatste login bekijken
Get-ADUser -Identity "hr-user1" -Properties LastLogonDate | Select-Object Name, LastLogonDate

# Alle gebruikers met laatste login
Get-ADUser -Filter * -Properties LastLogonDate | Select-Object Name, LastLogonDate | Sort-Object LastLogonDate -Descending

# Groepslidmaatschap controleren
Get-ADGroupMember -Identity "HR-Groep" | Select-Object Name
```

---

## NTFS Permissions via PowerShell

```powershell
# Huidige permissions bekijken
Get-Acl "C:\Shares\HR" | Format-List

# Inheritance uitschakelen en Everyone verwijderen
$mappen = @("C:\Shares\HR", "C:\Shares\IT", "C:\Shares\Management", "C:\Shares\Finance", "C:\Shares\Sales")

foreach ($map in $mappen) {
    $acl = Get-Acl $map
    $acl.SetAccessRuleProtection($true, $false)
    $everyone = $acl.Access | Where-Object {
        $_.IdentityReference -like "*Everyone*" -or
        $_.IdentityReference -like "*Users*"
    }
    foreach ($rule in $everyone) {
        $acl.RemoveAccessRule($rule)
    }
    Set-Acl $map $acl
    Write-Host "Everyone verwijderd van: $map" -ForegroundColor Green
}

# Juiste groep toegang geven
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
    $acl.AddAccessRule($rule)
    Set-Acl $afd.Map $acl
    Write-Host "Permissions ingesteld: $($afd.Map) -> $($afd.Groep)" -ForegroundColor Green
}
```

---

## SMB Share Permissions

```powershell
# Huidige share permissions bekijken
Get-SmbShareAccess -Name "HR"

# Everyone verwijderen van share
Revoke-SmbShareAccess -Name "HR" -AccountName "Everyone" -Force

# Juiste groep toegang geven
Grant-SmbShareAccess -Name "HR" -AccountName "LAB\HR-Groep" -AccessRight Full -Force
Grant-SmbShareAccess -Name "HR" -AccountName "LAB\Domain Admins" -AccessRight Full -Force

# Alle shares controleren
Get-SmbShare
Get-SmbShareAccess -Name "HR"
```

---

## File Share testen vanaf client

```powershell
# Map testen via PowerShell
Test-Path "\\192.168.100.10\HR"

# Map openen via Verkenner
# Typ in adresbalk:
# \\192.168.100.10\HR
# \\192.168.100.10\IT
```
