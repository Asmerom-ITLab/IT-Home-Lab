$server = $env:COMPUTERNAME
$datum = Get-Date -Format "dd-MM-yyyy HH:mm"

Write-Host "===== SYSTEEM RAPPORT =====" -ForegroundColor Cyan
Write-Host "Server: $server" -ForegroundColor Cyan
Write-Host "Datum: $datum" -ForegroundColor Cyan
Write-Host "===========================" -ForegroundColor Cyan

Write-Host ""
Write-Host "--- CPU ---" -ForegroundColor Yellow
$cpu = Get-WmiObject Win32_Processor
Write-Host "Naam: $($cpu.Name)"
Write-Host "Gebruik: $($cpu.LoadPercentage) procent"
Write-Host "Cores: $($cpu.NumberOfCores)"

Write-Host ""
Write-Host "--- RAM ---" -ForegroundColor Yellow
$os = Get-WmiObject Win32_OperatingSystem
$totaalRam = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
$vrijRam = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
$gebruiktRam = [math]::Round($totaalRam - $vrijRam, 2)
Write-Host "Totaal: $totaalRam GB"
Write-Host "Gebruikt: $gebruiktRam GB"
Write-Host "Vrij: $vrijRam GB"

Write-Host ""
Write-Host "--- SCHIJF ---" -ForegroundColor Yellow
$schijf = Get-PSDrive C
$totaalSchijf = [math]::Round(($schijf.Used + $schijf.Free) / 1GB, 1)
$gebruiktSchijf = [math]::Round($schijf.Used / 1GB, 1)
$vrijSchijf = [math]::Round($schijf.Free / 1GB, 1)
Write-Host "Totaal: $totaalSchijf GB"
Write-Host "Gebruikt: $gebruiktSchijf GB"
Write-Host "Vrij: $vrijSchijf GB"

Write-Host ""
Write-Host "--- ACTIVE DIRECTORY ---" -ForegroundColor Yellow
$totaalUsers = (Get-ADUser -Filter *).Count
$actiefUsers = (Get-ADUser -Filter {Enabled -eq $true}).Count
$inactiefUsers = (Get-ADUser -Filter {Enabled -eq $false}).Count
Write-Host "Totaal gebruikers: $totaalUsers"
Write-Host "Actief: $actiefUsers"
Write-Host "Inactief: $inactiefUsers"

Write-Host ""
Write-Host "--- SERVICES ---" -ForegroundColor Yellow
$services = @("ADWS", "DNS", "DHCPServer", "Netlogon")
foreach ($svc in $services) {
    $status = (Get-Service -Name $svc -ErrorAction SilentlyContinue).Status
    if ($status -eq "Running") {
        Write-Host "$svc : $status" -ForegroundColor Green
    } else {
        Write-Host "$svc : $status" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "===== RAPPORT KLAAR =====" -ForegroundColor Cyan