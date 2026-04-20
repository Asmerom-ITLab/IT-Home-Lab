# Bekende Problemen en Oplossingen

Dit document beschrijft de technische problemen die zijn tegengekomen
tijdens het bouwen van het IT Home Lab. Het documenteren van problemen
en oplossingen laat zien dat ik problemen kan analyseren en oplossen.
Dit is een belangrijke vaardigheid voor elke system administrator.

---

## Probleem 1 — DC02 promotie mislukt na klonen

**Wat ging er mis:**
DC02 was een kloon van DC01. Bij het promoveren als Domain Controller
gaf het systeem een foutmelding over een database conflict.

**Foutmelding:**
```
The Directory Server detected that the database has errors
NTDS service cannot start
ld.so: object 'libcrypto.so.30' not found
```

**Oorzaak:**
Wanneer je een Domain Controller kloont, neemt de kloon dezelfde
Active Directory database mee. Dit veroorzaakt conflicten omdat
beide servers dezelfde database hebben.

**Oplossing:**
DC02 opnieuw geinstalleerd vanuit een schone Windows Server 2025 ISO.
Daarna gepromoveerd als nieuwe Domain Controller via PowerShell.

**Wat ik heb geleerd:**
Een Domain Controller moet altijd via een schone installatie worden
opgezet — nooit via een kloon van een bestaande DC.

---

## Probleem 2 — WSUS SQL database timeout

**Wat ging er mis:**
Bij het installeren van WSUS gaf de postinstall een foutmelding over
een SQL database timeout.

**Foutmelding:**
```
Fatal Error: Failed to start and configure the WSUS service
ImportDefaultDetectoids failed — Execution Timeout Expired
```

**Oorzaak:**
De Windows Internal Database had te weinig tijd om alle detectoids
te importeren. De VM had te weinig RAM voor WSUS.

**Oplossing:**
SQL timeout verhoogd naar 7200 seconden via registry:
```powershell
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Update Services\Server\Setup" `
  -Name "SqlCommandTimeout" -Value 7200 -Type DWord
```
VM RAM verhoogd naar 6GB.

**Wat ik heb geleerd:**
WSUS heeft minimaal 4-6GB RAM nodig om correct te werken.

---

## Probleem 3 — Snort niet compatibel met pfSense 2.7

**Wat ging er mis:**
Snort IDS/IPS kon niet starten na installatie op pfSense 2.7.

**Foutmelding:**
```
ld-elf.so.1: Shared object "libcrypto.so.30" not found,
required by "snort"
```

**Oorzaak:**
Snort vereist een specifieke versie van libcrypto die niet beschikbaar
is in pfSense 2.7.0.

**Oplossing:**
Wazuh SIEM gebruikt als alternatief voor Snort. Wazuh biedt dezelfde
IDS/IPS functionaliteit en is beter ondersteund.

**Wat ik heb geleerd:**
Het is belangrijk om compatibiliteit te controleren voordat je software
installeert. Documenteer problemen eerlijk — dit is professioneler
dan het verbergen ervan.

---

## Probleem 4 — Ubuntu geen internet via pfSense

**Wat ging er mis:**
Ubuntu kon niet communiceren met pfSense gateway of internet,
terwijl alle andere VMs wel werkten.

**Symptomen:**
- Ping naar 192.168.50.1 — 100% packet loss
- Ping naar 8.8.8.8 — 100% packet loss
- ARP tabel toonde VMware MAC adres in plaats van pfSense MAC

**Oorzaak:**
VMware VMnet3 had een host adapter actief die als virtuele gateway
optrad en de pfSense gateway overschreef. Dit veroorzaakte een
ARP conflict waarbij Ubuntu pakketjes naar het verkeerde MAC adres stuurde.

**Oplossing:**
In VMware Virtual Network Editor de optie
"Connect a host virtual adapter to this network" uitgevinkt voor VMnet3.
Daarna ARP cache geleegd en route gereset:
```bash
sudo ip neigh flush all
sudo ip route del default
sudo ip route add default via 192.168.50.1 dev ens33
```

**Wat ik heb geleerd:**
VMware Host-only netwerken hebben een eigen virtuele adapter die
netwerk problemen kan veroorzaken. Bij problemen altijd de VMware
netwerk instellingen controleren.

---

## Probleem 5 — Wazuh dashboard start niet

**Wat ging er mis:**
Wazuh dashboard gaf een foutmelding en kon niet starten.

**Foutmelding:**
```
wazuh-dashboard.service: Failed with result exit-code
YAML parse error at line 4 column 20
```

**Oorzaak:**
Het wazuh.yml configuratiebestand had een null karakter en
gebruikte `user` in plaats van `username` als veldnaam.

**Oplossing:**
Configuratiebestand handmatig gecorrigeerd:
```yaml
hosts:
  - default:
      url: https://127.0.0.1
      port: 55000
      username: wazuh-wui
      password: <wachtwoord>
      run_as: false
```

**Wat ik heb geleerd:**
YAML bestanden zijn gevoelig voor exacte inspringing en veldnamen.
Altijd de logs bekijken voor de exacte foutmelding.

---

## Probleem 6 — pfSense niet bereikbaar na herstart

**Wat ging er mis:**
Na het herstarten van VMware waren alle VMs niet meer bereikbaar
via pfSense gateway.

**Symptomen:**
- Ping naar 192.168.50.1 mislukt
- ARP tabel leeg op pfSense em2
- tcpdump op em2 toont geen verkeer

**Oorzaak:**
VMnet3 was niet correct geconfigureerd na herstart van VMware.
De VMnet adapters van sommige VMs waren veranderd naar een ander netwerk.

**Oplossing:**
VMnet3 opnieuw aangemaakt in Virtual Network Editor.
Alle VM adapters gecontroleerd en teruggezet naar VMnet3.

**Wat ik heb geleerd:**
Na een herstart van VMware altijd de netwerk adapter instellingen
van alle VMs controleren. Maak snapshots voor grote wijzigingen.

---

## Probleem 7 — Wazuh agent installatie Ubuntu mislukt

**Wat ging er mis:**
De GPG key voor de Wazuh repository kon niet worden geimporteerd op Ubuntu 24.04.

**Foutmelding:**
```
gpg: no valid OpenPGP data found
E: Could not get lock /var/lib/apt/lists/lock
```

**Oorzaak:**
Ubuntu 24.04 gebruikt een nieuwe methode voor GPG keys en
de apt lock was bezet door een ander proces.

**Oplossing:**
Agent geinstalleerd via een direct gedownload .deb pakket
via SCP vanuit de RHEL server:
```bash
# Op RHEL
wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.7.5-1_amd64.deb
scp wazuh-agent_4.7.5-1_amd64.deb ubuntu@192.168.50.20:/home/ubuntu/

# Op Ubuntu
sudo dpkg -i wazuh-agent_4.7.5-1_amd64.deb
```

**Wat ik heb geleerd:**
Als een package manager niet werkt, kan een directe installatie
via een .deb of .rpm pakket een goede oplossing zijn.
