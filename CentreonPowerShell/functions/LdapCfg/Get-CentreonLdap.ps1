<#
    .SYNOPSIS
        Returns a list of ldap configurations
    .DESCRIPTION
        Returns a list of ldap configurations
    .EXAMPLE
        Get-CentreonLdap

        Returns all the ldap configuration in Centreon
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonLdap {
    Invoke-Centreon -Object LDAP -Action SHOW | Select-Object @{Name = "LdapName"; Expression = {$_.Name}}, * -ExcludeProperty Name
}