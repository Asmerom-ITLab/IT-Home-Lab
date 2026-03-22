# Linux Server — Gebruikte commando's

Alle Linux en bash commando's die ik heb gebruikt tijdens de lab.

---

## Systeem beheer

```bash
# Systeem updaten
sudo apt update
sudo apt upgrade -y
sudo apt update && sudo apt upgrade -y

# Systeem informatie
hostname
uname -a
lsb_release -a

# Ingelogde gebruikers
who
w

# Schijfruimte
df -h

# RAM gebruik
free -h

# CPU informatie
nproc
lscpu
```

---

## Netwerk configuratie

```bash
# IP adres bekijken
ip addr show
ip addr show ens33

# Netwerk configuratie bewerken
sudo nano /etc/netplan/00-installer-config.yaml

# Netwerk configuratie toepassen
sudo netplan apply

# Verbinding testen
ping 8.8.8.8
ping 192.168.100.10
ping lab.local

# DNS controleren
nslookup lab.local
```

---

## Hostname

```bash
# Hostname instellen
sudo hostnamectl set-hostname ubuntu-server

# Hostname bekijken
hostname
hostnamectl
```

---

## SSH

```bash
# SSH status controleren
sudo systemctl status ssh

# SSH starten
sudo systemctl start ssh

# SSH automatisch opstarten
sudo systemctl enable ssh

# SSH herstarten
sudo systemctl restart ssh

# SSH installeren
sudo apt install openssh-server -y
```

Verbinding maken vanuit Windows:

```powershell
ssh admin@192.168.100.20
```

---

## Apache webserver

```bash
# Apache installeren
sudo apt install apache2 -y

# Apache starten
sudo systemctl start apache2

# Apache automatisch opstarten
sudo systemctl enable apache2

# Apache status controleren
sudo systemctl status apache2

# Apache herstarten
sudo systemctl restart apache2

# Apache configuratie testen
sudo apache2ctl configtest
```

---

## UFW Firewall

```bash
# Firewall aanzetten
sudo ufw enable

# Firewall uitzetten
sudo ufw disable

# SSH toestaan
sudo ufw allow ssh
sudo ufw allow 22/tcp

# Apache toestaan
sudo ufw allow 'Apache'
sudo ufw allow 80/tcp

# Zabbix agent poort toestaan
sudo ufw allow 10050/tcp

# Firewall herladen
sudo ufw reload

# Firewall status bekijken
sudo ufw status
sudo ufw status verbose
```

---

## Zabbix agent

```bash
# Zabbix repository toevoegen
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo apt update

# Zabbix agent installeren
sudo apt install zabbix-agent -y

# Configuratie bewerken
sudo nano /etc/zabbix/zabbix_agentd.conf

# Zabbix agent starten
sudo systemctl start zabbix-agent
sudo systemctl enable zabbix-agent
sudo systemctl restart zabbix-agent

# Zabbix agent status controleren
sudo systemctl status zabbix-agent
```

---

## Bestand en map beheer

```bash
# Map aanmaken
mkdir mapnaam

# Bestand aanmaken
touch bestandsnaam.txt

# Bestand bekijken
cat bestandsnaam.txt

# Bestand bewerken
sudo nano bestandsnaam.txt

# Bestanden in map bekijken
ls
ls -la

# Map verwijderen
rm -r mapnaam

# Bestand verwijderen
rm bestandsnaam.txt
```

---

## Services beheer

```bash
# Service status bekijken
sudo systemctl status servicenaam

# Service starten
sudo systemctl start servicenaam

# Service stoppen
sudo systemctl stop servicenaam

# Service herstarten
sudo systemctl restart servicenaam

# Service automatisch opstarten
sudo systemctl enable servicenaam

# Alle actieve services bekijken
sudo systemctl list-units --type=service --state=active
```

---

## Handige commando's

```bash
# Geschiedenis van commando's bekijken
history

# Scherm leegmaken
clear

# Huidige map bekijken
pwd

# Map veranderen
cd /etc/zabbix

# Terug naar home map
cd ~

# Bestand zoeken
find / -name "bestandsnaam"

# Proces bekijken
ps aux
top
htop
```
