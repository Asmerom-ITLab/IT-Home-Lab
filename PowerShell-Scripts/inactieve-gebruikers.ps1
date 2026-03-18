$dagen = 30
$datum = (Get-Date).AddDays(-$dagen)

Write-Host "===== INACTIEVE GEBRUIKERS =====" -ForegroundColor Cyan
Write-Host "Niet ingelogd sinds: $($datum.ToString('dd-MM-yyyy'))" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

$inactief = Get-ADUser -Filter * -Properties LastLogonDate, Enabled |
  Where-Object {
    $_.Enabled -eq $true -and
    ($_.LastLogonDate -eq $null -or $_.LastLogonDate -lt $datum)
  } |
  Select-Object Name, SamAccountName, LastLogonDate

Write-Host ""
Write-Host "Gevonden inactieve gebruikers:" -ForegroundColor Yellow

if ($inactief.Count -eq 0) {
    Write-Host "Geen inactieve gebruikers gevonden!" -ForegroundColor Green
} else {
    foreach ($user in $inactief) {
        $laatste = if ($user.LastLogonDate) {
            $user.LastLogonDate.ToString('dd-MM-yyyy')
        } else {
            "Nooit ingelogd"
        }
        Write-Host "  $($user.Name) - Laatste login: $laatste" -ForegroundColor Red
    }

    Write-Host ""
    Write-Host "Totaal inactief: $($inactief.Count)" -ForegroundColor Yellow
    Write-Host ""

    $bevestiging = Read-Host "Wil je deze gebruikers uitschakelen? (ja/nee)"

    if ($bevestiging -eq "ja") {
        foreach ($user in $inactief) {
            Disable-ADAccount -Identity $user.SamAccountName
            Write-Host "Uitgeschakeld: $($user.Name)" -ForegroundColor Green
        }
        Write-Host ""
        Write-Host "Klaar! $($inactief.Count) gebruikers uitgeschakeld." -ForegroundColor Green
    } else {
        Write-Host "Geannuleerd - geen gebruikers uitgeschakeld." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "===== KLAAR =====" -ForegroundColor Cyan