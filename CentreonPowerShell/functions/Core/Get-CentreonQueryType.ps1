<#
    .SYNOPSIS
        Gets query type used to call centreon
    .DESCRIPTION
        Gets query type used to call centreon
    .EXAMPLE
    Get-CentreonQueryType

    Returns the query type
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonQueryType {
    [CmdletBinding()]
    $QueryType = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.QueryType
    if (-not $QueryType) {
        throw "Please use Set-CentreonQueryType (-Register)"
    }
    $QueryType
}