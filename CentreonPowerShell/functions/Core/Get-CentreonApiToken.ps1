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
function Get-CentreonApiToken {
    [CmdletBinding()]
    $ApiToken = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.ApiToken
    if (-not $ApiToken) {
        throw "Please use New-CentreonApiToken"
    }
    $ApiToken
}