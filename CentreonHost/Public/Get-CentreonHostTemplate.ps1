function Get-CentreonHostTemplate {
    Invoke-Centreon -CentreonSession $CentreonSession -Option HTPL -Action SHOW
}