<#
    .SYNOPSIS
        Sets a ldap server parameter value
    .DESCRIPTION
        Sets a ldap server parameter value
    .PARAMETER Id
        Id of the ldap server
    .PARAMETER Parameter
        Ldap server Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonLdapServerParameter -Id "2" -Parameter use_ssl -Value "1"

        Sets the parameter enable with a new value on ldap configuration
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonLdapServerParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Id,
        [Parameter(Mandatory)]
        [ValidateSet(
            "host_address",
            "host_port",
            "host_order",
            "use_ssl",
            "use_tls"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Id)) {
            foreach ($_id in $Id) {
                Invoke-Centreon -Object LDAP -Action SETPARAMSERVER -Value "$_id;$Parameter;$Value"
            }
        }
    }
    end {

    }
}