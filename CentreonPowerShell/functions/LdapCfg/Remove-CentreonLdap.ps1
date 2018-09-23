<#
    .SYNOPSIS
        Removes an existing ldap
    .DESCRIPTION
        Removes an existing ldap
    .PARAMETER LdapName
        Corresponds to the name of the ldap
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonTrap -LdapName "AD"

        Removes the ldap configuration AD
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonLdap {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $LdapName
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($LdapName)) {
            foreach ($_ldapname in $LdapName) {
                Invoke-Centreon -Object LDAP -Action DEL -Value $_ldapname
            }
        }
    }
    end {

    }
}