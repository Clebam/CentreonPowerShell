function Get-CentreonServiceTemplate {
    Invoke-Centreon -CentreonSession $CentreonSession -Option STPL -Action SHOW
}