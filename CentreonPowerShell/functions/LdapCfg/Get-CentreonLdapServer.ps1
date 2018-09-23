<#
    .SYNOPSIS
        Returns informations of specified server
    .DESCRIPTION
        Returns informations of specified server
    .PARAMETER LdapServer
        Name of the ldap server
    .EXAMPLE
        Get-CentreonLdapServer -LdapServer "openldap"

        Returns informations of ldap server "ppenldap"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonLdapServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $LdapServer
    )
    begin {

    }
    process {
        foreach ($_ldapserver in $LdapServer) {
            $PSObject = [PSCustomObject]@{
                LdapServer  = $_ldapserver -as [string]
                Rules = Invoke-Centreon -Object LDAP -Action SHOWSERVER -Value "$_ldapserver"
            }
            $PSObject
        }
    }
    end {

    }
}