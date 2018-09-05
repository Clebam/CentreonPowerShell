function Get-CentreonCommand {
    Invoke-Centreon -CentreonSession $CentreonSession -Option CMD -Action SHOW
}