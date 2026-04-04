# Certificate Authority — Gebruikte commando's

---

## AD CS installatie

```powershell
# AD CS rol installeren
Install-WindowsFeature -Name AD-Certificate, ADCS-Cert-Authority, ADCS-Web-Enrollment -IncludeManagementTools

# Installatie controleren
Get-WindowsFeature -Name AD-Certificate
```

---

## CA configureren

```powershell
# Enterprise Root CA installeren
Install-AdcsCertificationAuthority `
  -CAType EnterpriseRootCa `
  -CACommonName "lab-CA" `
  -KeyLength 2048 `
  -HashAlgorithmName SHA256 `
  -ValidityPeriod Years `
  -ValidityPeriodUnits 5 `
  -Force

# CA service starten
Start-Service -Name CertSvc

# CA status controleren
Get-Service -Name CertSvc

# CA informatie bekijken
certutil -ping
```

---

## Certificaten beheren

```powershell
# Alle certificaten bekijken in lokale store
Get-ChildItem -Path "Cert:\LocalMachine\My"

# CA certificaat bekijken
Get-ChildItem -Path "Cert:\LocalMachine\Root" | Where-Object {$_.Subject -like "*lab-CA*"}

# Certificaat aanvragen
$cert = Get-Certificate `
  -Template "LabWebServer" `
  -SubjectName "CN=DC01.lab.local" `
  -DnsName "DC01.lab.local","DC01" `
  -CertStoreLocation "Cert:\LocalMachine\My"

# Certificaat exporteren
$ca = Get-ChildItem -Path "Cert:\LocalMachine\Root" | Where-Object {$_.Subject -like "*lab-CA*"} | Select-Object -First 1
Export-Certificate -Cert $ca -FilePath "C:\lab-CA.cer" -Type CERT

# Certificaat importeren
Import-Certificate -FilePath "C:\lab-CA.cer" -CertStoreLocation "Cert:\LocalMachine\Root"
```

---

## CA management tools

```powershell
# Certificate Authority console openen
certsrv.msc

# Certificate Templates console openen
certtmpl.msc

# Certificate Manager openen
certmgr.msc

# CA status controleren
certutil -ping

# Uitgegeven certificaten bekijken
certutil -view
```

---

## GPO voor CA vertrouwen

```powershell
# GPO aanmaken
New-GPO -Name "CA Vertrouwen Beleid"
New-GPLink -Name "CA Vertrouwen Beleid" -Target "DC=lab,DC=local"

# GPO toepassen op client
gpupdate /force

# CA vertrouwen controleren op client
Get-ChildItem -Path "Cert:\LocalMachine\Root" | Where-Object {$_.Subject -like "*lab-CA*"}
```

---

## Troubleshooting

```powershell
# CA service herstarten
Restart-Service -Name CertSvc

# CA logs bekijken
Get-EventLog -LogName Application -Source "Microsoft-Windows-CertificationAuthority" -Newest 10

# Certificaat geldigheid controleren
$cert = Get-ChildItem -Path "Cert:\LocalMachine\My" | Where-Object {$_.Subject -like "*DC01*"}
$cert | Select-Object Subject, NotBefore, NotAfter, Thumbprint
```
