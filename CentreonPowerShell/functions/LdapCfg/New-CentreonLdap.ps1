<#
    .SYNOPSIS
        Creates a new ldap
    .DESCRIPTION
        Creates a new ldap
    .PARAMETER LdapName
        Corresponds to the name of the ldap configuration
    .PARAMETER Description
        Corresponds to the description of the ldap configuration
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonLdap -LdapName "AD" -Description "Mamoudzou AD"

        Creates a new trap named "AD" with its description
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonLdap {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $LdapName,
        [ValidateNotNullOrEmpty()]
        [string] $Description
    )
    if ($PSCmdlet.ShouldProcess($LdapName)) {
        Invoke-Centreon -Object LDAP -Action ADD -Value "$LdapName;$Description"
    }
}