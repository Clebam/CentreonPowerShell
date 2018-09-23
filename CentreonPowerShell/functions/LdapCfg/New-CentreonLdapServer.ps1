<#
    .SYNOPSIS
        Creates a new ldap configuration
    .DESCRIPTION
        Creates a new ldap configuration
    .PARAMETER LdapName
        Name of the ldap configuration
    .PARAMETER ServerName
        Ldap Servername or IP Address
    .PARAMETER Port
        Ldap Port number (Default : 389)
    .PARAMETER UseSsl
        Use SSL
    .PARAMETER UseTls
        Use TLS
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        New-CentreonLdapServer -LdapName "AD" -ServerName "10.0.0.250" -UseSsl

        Creates a new ldap server with name AD, IP 10.0.0.250 ans SSL
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonLdapServer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $LdapName,
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ServerName,
        [ValidateNotNullOrEmpty()]
        [string] $Port = 389,
        [switch] $UseSsl,
        [switch] $UseTls

    )
    begin {
        $SSL = 0
        $TLS = 0
        if ($UseSSL) {
            $SSL = 1
        }
        if ($UseTLS) {
            $TLS = 1
        }
    }
    process {
        Invoke-Centreon -Object LDAP -Action ADDSERVER -Value "$LdapName;$ServerName;$Port;$SSL;$TLS"
    }
    end {

    }
}