# Remote Desktop Services — Gebruikte commando's

---

## RDS installatie

```powershell
# RDS rollen installeren
Install-WindowsFeature -Name RDS-RD-Server, RDS-Connection-Broker, RDS-Web-Access -IncludeManagementTools

# Installatie controleren
Get-WindowsFeature | Where-Object {$_.Name -like "RDS*" -and $_.Installed -eq $true}
```

---

## Gebruikers beheer

```powershell
# Domein gebruikers toevoegen aan Remote Desktop Users
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "LAB\Domain Users"

# Groepsleden bekijken
Get-LocalGroupMember -Group "Remote Desktop Users"

# Specifieke gebruiker toevoegen
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "LAB\hr-user1"
```

---

## Firewall

```powershell
# RDP firewall regel inschakelen
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Firewall regels bekijken
Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Select-Object DisplayName, Enabled

# RDP poort controleren
Test-NetConnection -ComputerName DC01 -Port 3389
```

---

## Sessies beheren

```powershell
# Actieve sessies bekijken
query session /server:DC01

# Ingelogde gebruikers bekijken
query user /server:DC01

# Sessie verbreken
logoff <sessie-id> /server:DC01
```

---

## GPO voor RDS

```powershell
# GPO aanmaken
New-GPO -Name "Remote Desktop Beleid"
New-GPLink -Name "Remote Desktop Beleid" -Target "DC=lab,DC=local"

# GPO toepassen op client
gpupdate /force

# GPO controleren
gpresult /r | findstr "Remote Desktop"
```

---

## RDP verbinding testen

```powershell
# RDP verbinding openen
mstsc /v:192.168.50.10

# RDP verbinding met opgeslagen credentials
cmdkey /generic:192.168.50.10 /user:"LAB\hr-user1" /pass:"Welkom@123"
mstsc /v:192.168.50.10

# Opgeslagen credentials verwijderen
cmdkey /delete:192.168.50.10
```
