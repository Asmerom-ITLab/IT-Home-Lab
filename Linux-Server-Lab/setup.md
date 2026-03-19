# Linux Server Lab — Setup

Stap voor stap uitleg van hoe ik de Linux Server lab heb uitgevoerd.

---

## Stap 1 — Ubuntu Server VM aanmaken in VMware

Ubuntu Server 24.04 LTS ISO gedownload van ubuntu.com en een nieuwe
VM aangemaakt in VMware Workstation met deze specs:

| Instelling | Waarde |
|---|---|
| RAM | 2048 MB |
| CPU | 2 cores |
| Schijf | 40 GB |
| Netwerk | VMnet8 (NAT) |

Tijdens de installatie heb ik OpenSSH server aangevinkt zodat SSH
direct beschikbaar is na de installatie.

---

## Stap 2 — Systeem updaten

Het eerste wat je doet op een nieuwe Linux server is het systeem updaten:

```bash
sudo apt update && sudo apt upgrade -y
```

Dit zorgt dat alle software up-to-date is en beveiligingsupdates
zijn geinstalleerd.

---

## Stap 3 — Statisch IP instellen via Netplan

```bash
sudo nano /etc/netplan/00-installer-config.yaml
```

Inhoud van het bestand:

```yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      addresses:
        - 192.168.100.20/24
      gateway4: 192.168.100.2
      nameservers:
        addresses:
          - 192.168.100.10
          - 8.8.8.8
```

Toepassen:

```bash
sudo netplan apply
```

Controleren:

```bash
ip addr show
ping 192.168.100.10
```

---

## Stap 4 — Hostname instellen

```bash
sudo hostnamectl set-hostname ubuntu-server
hostname
```

---

## Stap 5 — SSH installeren en starten

SSH was al geinstalleerd tijdens de Ubuntu installatie.
Ik heb de status gecontroleerd en de service gestart:

```bash
sudo systemctl status ssh
sudo systemctl start ssh
sudo systemctl enable ssh
```

SSH verbinding getest vanuit Windows 10:

```powershell
ssh admin@192.168.100.20
```

---

## Stap 6 — Apache webserver installeren

```bash
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2
```

Getest via browser op Windows 10:

```
http://192.168.100.20
```

De Apache2 Ubuntu Default Page was zichtbaar.

---

## Stap 7 — UFW firewall instellen

```bash
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 'Apache'
sudo ufw status
```

Firewall staat nu actief met SSH en Apache toegestaan.

---

## Stap 8 — Zabbix agent installeren

```bash
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo apt update
sudo apt install zabbix-agent -y
```

Configuratie aangepast:

```bash
sudo nano /etc/zabbix/zabbix_agentd.conf
```

Instellingen gewijzigd:

```
Server=192.168.100.20
ServerActive=192.168.100.20
Hostname=ubuntu-server
```

Agent gestart:

```bash
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent
sudo systemctl status zabbix-agent
```

---

## Stap 9 — Firewall openen voor Zabbix

```bash
sudo ufw allow 10050/tcp
sudo ufw reload
```

---

## Wat ik heb geleerd

- Hoe je een Linux server installeert en configureert in VMware
- Hoe Netplan werkt voor netwerkconfiguratie in Ubuntu
- Hoe SSH werkt en hoe je het configureert
- Hoe je een Apache webserver installeert en beheert
- Hoe UFW firewall werkt op Ubuntu
- Hoe je een Zabbix agent configureert voor monitoring
- Hoe je verbinding maakt met een Linux server via SSH vanuit Windows
