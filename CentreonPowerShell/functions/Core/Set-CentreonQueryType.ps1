<#
    .SYNOPSIS
        Sets query type used to call centreon
    .DESCRIPTION
        Sets query type used to call centreon
    .EXAMPLE
        Set-CentreonQueryType -QueryType WebApi

        Sets the query type
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonQueryType {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateSet("WebApi","Binary")]
        [ValidateNotNullOrEmpty()]
        [string] $QueryType,
        [switch] $Register
    )
    if ($PSCmdlet.ShouldProcess("Config")) {
        Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.QueryType' -Value $QueryType
        if ($Register) {
            Register-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.QueryType'
        }
    }
}