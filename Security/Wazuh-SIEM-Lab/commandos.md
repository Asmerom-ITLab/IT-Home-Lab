# Wazuh SIEM — Gebruikte commando's

---

## RHEL 9 installatie en registratie

```bash
# Systeem registreren
sudo subscription-manager register --username <username> --password <password>
sudo subscription-manager attach --auto

# Systeem updaten
sudo dnf update -y

# Basis tools installeren
sudo dnf install -y wget curl net-tools
```

---

## Wazuh server installatie op RHEL

```bash
# Wazuh installatie script downloaden
curl -sO https://packages.wazuh.com/4.7/wazuh-install.sh

# Installeren
sudo bash wazuh-install.sh -a -i

# Services controleren
sudo systemctl status wazuh-manager | grep Active
sudo systemctl status wazuh-indexer | grep Active
sudo systemctl status wazuh-dashboard | grep Active

# Services herstarten
sudo systemctl restart wazuh-manager
sudo systemctl restart wazuh-indexer
sudo systemctl restart wazuh-dashboard
```

---

## RHEL Firewall configuratie

```bash
# Poorten openen
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=1514/tcp
sudo firewall-cmd --permanent --add-port=1515/tcp
sudo firewall-cmd --permanent --add-port=55000/tcp
sudo firewall-cmd --permanent --add-port=9200/tcp
sudo firewall-cmd --reload

# Controleren
sudo firewall-cmd --list-ports
```

---

## Wazuh agent op Windows

```powershell
# Agent downloaden
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-4.7.5-1.msi" -OutFile "C:\wazuh-agent.msi"

# Agent installeren
Start-Process -FilePath "msiexec.exe" `
  -ArgumentList "/i C:\wazuh-agent.msi /q WAZUH_MANAGER='192.168.100.50' WAZUH_AGENT_NAME='DC01'" `
  -Wait

# Agent starten
Start-Service -Name WazuhSvc
Set-Service -Name WazuhSvc -StartupType Automatic
Get-Service -Name WazuhSvc

# Logs bekijken
Get-Content "C:\Program Files (x86)\ossec-agent\ossec.log" -Tail 20
```

---

## Wazuh agent op Ubuntu

```bash
# Via SCP kopiëren als geen internet
scp wazuh-agent_4.7.5-1_amd64.deb ubuntu@192.168.50.20:/home/ubuntu/

# Installeren
sudo WAZUH_MANAGER='192.168.100.50' WAZUH_AGENT_NAME='ubuntu-server' dpkg -i wazuh-agent_4.7.5-1_amd64.deb

# Agent starten
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
sudo systemctl status wazuh-agent | grep Active

# Logs bekijken
sudo tail -f /var/ossec/logs/ossec.log
```

---

## Wazuh agent beheer

```bash
# Alle agents bekijken
sudo /var/ossec/bin/agent_control -l

# Agent status bekijken
sudo /var/ossec/bin/agent_control -s
```

---

## Security events testen

```powershell
# CPU stress test
$jobs = @()
for ($i = 0; $i -lt 4; $i++) {
    $jobs += Start-Job -ScriptBlock {
        $end = (Get-Date).AddSeconds(60)
        while ((Get-Date) -lt $end) {
            $x = 1
            for ($j = 0; $j -lt 1000000; $j++) {
                $x = $x * 2 / 2
            }
        }
    }
}
Write-Host "CPU stress test gestart!" -ForegroundColor Yellow
Start-Sleep -Seconds 65
$jobs | Stop-Job
$jobs | Remove-Job
Write-Host "Klaar!" -ForegroundColor Green
```
