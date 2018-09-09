<#
    .SYNOPSIS
        Sets credentials needed to call centreon
    .DESCRIPTION
        Sets credentials needed to call centreon
    .EXAMPLE
    Get-CentreonBinary

    Returns the binary
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonBinary {
    [CmdletBinding()]
    $Binary = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.Binary
    if (-not $Binary) {
        throw "Please use Set-CentreonBinary (-Register)"
    }
    $Binary
}