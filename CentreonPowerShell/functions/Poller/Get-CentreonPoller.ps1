<#
    .SYNOPSIS
        Returns a list of pollers
    .DESCRIPTION
        Returns a list of pollers
    .EXAMPLE
        Get-CentreonPoller

        Returns all the pollers in Centreon
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonPoller {
    Invoke-Centreon -Action POLLERLIST | Select-Object -SkipLast 1 | Select-Object @{Name = "Poller"; Expression = {$_.Name}}, @{Name = "Id"; Expression = {$_.poller_id}}  # Removes the return statement
}