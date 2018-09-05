function Get-CentreonHost {
    Invoke-Centreon -CentreonSession $CentreonSession -Option HOST -Action SHOW
}