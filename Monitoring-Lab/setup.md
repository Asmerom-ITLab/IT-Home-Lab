# Monitoring Lab — Setup

Stap voor stap uitleg van hoe ik Zabbix heb geinstalleerd en geconfigureerd.

---

## Stap 1 — Zabbix repository toevoegen

Via SSH verbonden met Ubuntu Server vanuit Windows 10:

```powershell
ssh ubuntu@192.168.100.20
```

Repository gedownload en geinstalleerd:

```bash
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu24.04_all.deb
sudo apt update
```

---

## Stap 2 — Zabbix installeren

```bash
sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y
```

---

## Stap 3 — MySQL database aanmaken

```bash
sudo apt install mysql-server -y
sudo mysql
```

In MySQL:

```sql
create database zabbix character set utf8mb4 collate utf8mb4_bin;
create user zabbix@localhost identified by 'Welkom@123';
grant all privileges on zabbix.* to zabbix@localhost;
set global log_bin_trust_function_creators = 1;
quit;
```

---

## Stap 4 — Database importeren

```bash
sudo zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix
```

---

## Stap 5 — Zabbix configureren

```bash
sudo nano /etc/zabbix/zabbix_server.conf
```

DBPassword ingesteld:

```
DBPassword=Welkom@123
```

---

## Stap 6 — Zabbix starten

```bash
sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2
sudo systemctl status zabbix-server
```

---

## Stap 7 — Zabbix web interface configureren

Via browser op Windows 10: http://192.168.100.20/zabbix

Setup wizard doorlopen:
- Database: zabbix / Welkom@123
- Server naam: DC01-Lab

Ingelogd met Admin / zabbix

---

## Stap 8 — Zabbix agent configureren op Ubuntu

```bash
sudo nano /etc/zabbix/zabbix_agentd.conf
```

Instellingen gewijzigd:

```
Server=192.168.100.20
ServerActive=192.168.100.20
Hostname=ubuntu-server
```

Firewall geopend:

```bash
sudo ufw allow 10050/tcp
sudo ufw reload
sudo systemctl restart zabbix-agent
```

---

## Stap 9 — Hosts toevoegen in Zabbix

Via Data collection → Hosts → Create host:

Host 1 — DC01:
- Host name: DC01
- IP: 192.168.100.10
- Template: Windows by Zabbix agent

Host 2 — ubuntu-server:
- Host name: ubuntu-server
- IP: 192.168.100.20
- Template: Linux by Zabbix agent

---

## Stap 10 — Controleren

Beide hosts tonen groen ZBX in het dashboard.
CPU en RAM grafieken zijn beschikbaar.

---

## Wat ik heb geleerd

- Hoe Zabbix werkt als monitoring platform
- Hoe je Zabbix installeert op Ubuntu Server
- Hoe je een MySQL database configureert voor Zabbix
- Hoe je servers toevoegt als hosts in Zabbix
- Hoe je de Zabbix agent configureert
- Het belang van infrastructure monitoring in een bedrijfsomgeving
