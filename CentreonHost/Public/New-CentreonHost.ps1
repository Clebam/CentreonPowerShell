function New-CentreonHost {
    param ($HostName, $Description, $HostAddress,$Template, $PollerName, $HostGroup, [switch]$ApplyTemplate )
    $Value = "$HostName;$Description;$HostAddress;$Template;$PollerName;$HostGroup"
    Invoke-Centreon -CentreonSession $CentreonSession -Option HOST -Action ADD -Value $Value
    if ($ApplyTemplate) {
        Invoke-Centreon -CentreonSession $CentreonSession -Option HOST -Action APPLYTPL -Value $HostName
    }
}