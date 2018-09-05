function New-CentreonHostGroup {
    param ($Name, $Description)
    $Value = "$Description;$Name"
    Invoke-Centreon -CentreonSession $CentreonSession -Option HG -Action ADD -Value $Value
}