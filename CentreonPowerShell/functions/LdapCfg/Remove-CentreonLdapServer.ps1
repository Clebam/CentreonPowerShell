<#
    .SYNOPSIS
        Removes a trap matching rules
    .DESCRIPTION
        Removes a trap matching rules
    .PARAMETER Id
        ID of the matching rule
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonLdapServer -Id "8"

        Removes the ldap server with ID 8
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonLdapServer {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Id
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Id)) {
            foreach ($_id in $Id) {
                Invoke-Centreon -Object LDAP -Action DELSERVER -Value "$_id"
            }
        }
    }
    end {

    }
}