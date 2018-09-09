<#
    .SYNOPSIS
        Returns the credential stored in config.json
    .DESCRIPTION
        Returns the credential stored in config.json
    .EXAMPLE
        Get-CentreonCredential

        Returns the credential needed to call centreon command
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonCredential {
    [CmdletBinding()]
    $ConfigObject = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.Credential
    if (-not $ConfigObject) {
        throw "Please use Set-CentreonCredential (-Register)"
    }
    $CentreonSession = [PSCustomObject]@{
        UserName = $ConfigObject.UserName
        Password = $ConfigObject.GetNetworkCredential().Password
    }
    $CentreonSession
}