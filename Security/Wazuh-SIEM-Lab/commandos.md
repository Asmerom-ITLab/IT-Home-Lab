# Wazuh SIEM — Gebruikte commando's

---

## RHEL 9 installatie en configuratie

```bash
# Systeem registreren
sudo subscription-manager register --username <username> --password <password>
sudo subscription-manager attach --auto

# Systeem updaten
sudo dnf update -y

# Wazuh repository toevoegen
sudo rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH
sudo cat > /etc/yum.repos.d/wazuh.repo << EOF
[wazuh]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=EL-\$releasever - Wazuh
baseurl=https://packages.wazuh.com/4.x/yum/
protect=1
EOF

# Wazuh installeren
curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh
sudo bash wazuh-install.sh -a -i
```

---

## Wazuh services beheren

```bash
# Services status controleren
sudo systemctl status wazuh-manager
sudo systemctl status wazuh-indexer
sudo systemctl status wazuh-dashboard

# Services herstarten in juiste volgorde
sudo systemctl restart wazuh-indexer
sleep 30
sudo systemctl restart wazuh-manager
sleep 20
sudo systemctl restart wazuh-dashboard

# Services automatisch starten
sudo systemctl enable wazuh-manager wazuh-indexer wazuh-dashboard
```

---

## Firewall configuratie op RHEL

```bash
# Poorten openen
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=1514/tcp
sudo firewall-cmd --permanent --add-port=1514/udp
sudo firewall-cmd --permanent --add-port=1515/tcp
sudo firewall-cmd --permanent --add-port=55000/tcp
sudo firewall-cmd --permanent --add-port=9200/tcp
sudo firewall-cmd --reload

# Poorten controleren
sudo firewall-cmd --list-ports
```

---

## Wazuh Agent installatie Windows

```powershell
# Agent downloaden en installeren
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-4.7.5-1.msi" -OutFile "C:\wazuh-agent.msi"

Start-Process -FilePath "msiexec.exe" `
  -ArgumentList "/i C:\wazuh-agent.msi /q WAZUH_MANAGER='192.168.100.50' WAZUH_AGENT_NAME='DC01'" `
  -Wait

# Agent starten
Start-Service -Name WazuhSvc
Set-Service -Name WazuhSvc -StartupType Automatic
Get-Service -Name WazuhSvc

# Agent configuratie bekijken
notepad "C:\Program Files (x86)\ossec-agent\ossec.conf"

# Agent logs bekijken
Get-Content "C:\Program Files (x86)\ossec-agent\ossec.log" -Tail 20

# Agent herstarten
Restart-Service -Name WazuhSvc
```

---

## Wazuh Agent installatie Ubuntu

```bash
# Agent installeren via deb pakket
sudo WAZUH_MANAGER='192.168.100.50' WAZUH_AGENT_NAME='ubuntu-server' dpkg -i wazuh-agent_4.7.5-1_amd64.deb

# Agent configureren
sudo nano /var/ossec/etc/ossec.conf

# Agent starten
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
sudo systemctl status wazuh-agent

# Agent logs bekijken
sudo tail -f /var/ossec/logs/ossec.log
```

---

## File Integrity Monitoring

```xml
<!-- ossec.conf op DC01 — FIM configuratie -->
<syscheck>
  <disabled>no</disabled>
  <frequency>300</frequency>
  <directories check_all="yes" realtime="yes">C:\Shares</directories>
  <directories check_all="yes" realtime="yes">C:\Scripts</directories>
  <directories check_all="yes">C:\Windows\System32</directories>
  <ignore>C:\Windows\System32\LogFiles</ignore>
  <ignore>C:\Windows\System32\wbem</ignore>
</syscheck>
```

```powershell
# FIM testen — bestand aanmaken
New-Item -Path "C:\Shares\IT\fim-test.txt" -ItemType File -Value "FIM test - $(Get-Date)"
Start-Sleep -Seconds 30

# Bestand wijzigen
Add-Content -Path "C:\Shares\IT\fim-test.txt" -Value "Bestand gewijzigd"
Start-Sleep -Seconds 30

# Bestand verwijderen
Remove-Item -Path "C:\Shares\IT\fim-test.txt"
```

---

## Brute Force detectie simulatie

```powershell
# Mislukte logins simuleren
$gebruiker = "administrator"
$verkeerd_ww = ConvertTo-SecureString "WerkwoordFout123" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($gebruiker, $verkeerd_ww)

for ($i = 1; $i -le 10; $i++) {
    try {
        $session = New-PSSession -ComputerName DC01 -Credential $cred -ErrorAction Stop
    } catch {
        Write-Host "Poging $i mislukt — $(Get-Date)" -ForegroundColor Red
    }
    Start-Sleep -Seconds 2
}

# Event 4625 bekijken
Get-EventLog -LogName Security -InstanceId 4625 -Newest 10 | Select-Object TimeGenerated, Message
```

---

## Wazuh API commando's

```bash
# API testen
curl -k -u wazuh-wui:'<wachtwoord>' https://localhost:55000

# Token ophalen
TOKEN=$(curl -u wazuh-wui:'<wachtwoord>' -k -X GET "https://localhost:55000/security/user/authenticate?raw=true")

# Alle agents bekijken
curl -k -X GET "https://localhost:55000/agents" -H "Authorization: Bearer $TOKEN"

# Agent status bekijken
curl -k -X GET "https://localhost:55000/agents/summary/status" -H "Authorization: Bearer $TOKEN"
```

---

## Wazuh passwords beheren

```bash
# Alle wachtwoorden bekijken
sudo tar -O -xvf ~/wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt

# Wachtwoord resetten
sudo /usr/share/wazuh-indexer/plugins/opensearch-security/tools/wazuh-passwords-tool.sh -u wazuh-wui -p NieuwWachtwoord123!
```

---

## Wazuh manager logs

```bash
# Manager logs bekijken
sudo tail -f /var/ossec/logs/ossec.log

# Alerts bekijken
sudo tail -f /var/ossec/logs/alerts/alerts.log

# Agent verbindingen bekijken
sudo /var/ossec/bin/agent_control -l

# Agent status bekijken
sudo /var/ossec/bin/agent_control -i 001
```
