<#
    .SYNOPSIS
        Sets a ldap configuration parameter value
    .DESCRIPTION
        Sets a ldap configuration parameter value
    .PARAMETER LdapName
        Name of the ldap configuration
    .PARAMETER Parameter
        Ldap Parameter to set
    .PARAMETER Value
        Value applied to parameter
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Set-CentreonLdapParameter -LdapName "AD" -Parameter enable -Value "0"

        Sets the parameter enable with a new value on ldap configuration
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonLdapParameter {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $LdapName,
        [Parameter(Mandatory)]
        [ValidateSet(
            "name",
            "description",
            "enable",
            "alias",
            "bind_dn",
            "bind_pass",
            "group_base_search",
            "group_filter",
            "group_member",
            "group_name",
            "ldap_auto_import",
            "ldap_contact_tmpl",
            "ldap_dns_use_domain",
            "ldap_search_limit",
            "ldap_search_timeout",
            "ldap_srv_dns",
            "ldap_store_password",
            "ldap_template",
            "protocol_version",
            "user_base_search",
            "user_email",
            "user_filter",
            "user_firstname",
            "user_lastname",
            "user_name",
            "user_pager",
            "user_group"
        )]
        [string] $Parameter,
        [Parameter(Mandatory)]
        $Value
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($LdapName)) {
            foreach ($_ldapname in $LdapName) {
                Invoke-Centreon -Object LDAP -Action SETPARAM -Value "$_ldapname;$Parameter;$Value"
            }
        }
    }
    end {

    }
}