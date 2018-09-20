<#
    .SYNOPSIS
        Sets query type used to call centreon
    .DESCRIPTION
        Sets query type used to call centreon
    .PARAMETER Register
        Register the the query type to a configuration file
    .PARAMETER QueryType
        Define if centreon uses binary or webapi to send queries. (You can also Set-CentreonQueryType)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
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