<#
    .SYNOPSIS
        Sets credentials needed to call centreon
    .DESCRIPTION
        Sets credentials needed to call centreon
    .PARAMETER Credential
        Login/Password of an admin account of centreon
    .PARAMETER Register
        Register the credentials to a configuration file (!!! Might be insecure !!!)
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
    Set-CentreonCredential -Credential (Get-Credential) -Register

    Sets credentials for the user and stores then in a configuration file
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonCredential {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [pscredential] $Credential,
        [switch] $Register
    )

    Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Credential' -Value $Credential
    if ($Register) {
        Register-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Credential'
    }
}