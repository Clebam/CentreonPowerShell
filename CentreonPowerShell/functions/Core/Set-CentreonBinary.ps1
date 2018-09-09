<#
    .SYNOPSIS
        Sets binary used to call centreon CLAPI
    .DESCRIPTION
        Sets binary used to call centreon CLAPI
    .PARAMETER Binary
        Name or path to the binary of centreon (default: centreon)
    .PARAMETER Register
        Register the credentials to a configuration file
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
    Set-CentreonBinary -Binary centreon -Register

    Sets binary and stores then in a configuration file
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonBinary {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Binary,
        [switch] $Register
    )

    Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Binary' -Value $Binary
    if ($Register) {
        Register-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Binary'
    }
}