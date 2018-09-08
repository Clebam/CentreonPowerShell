<#
    .SYNOPSIS
        Returns the credential stored in config.json
    .DESCRIPTION
        Returns the credential stored in config.json
    .EXAMPLE
        Get-CentreonCredential
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonCredential {

    $ConfigObject = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.Credential
    $CentreonSession = [PSCustomObject]@{
        UserName = $ConfigObject.UserName
        Password = $ConfigObject.GetNetworkCredential().Password
    }
    $CentreonSession
}