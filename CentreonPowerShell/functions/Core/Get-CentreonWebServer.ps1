<#
    .SYNOPSIS
        Gets the Centreon web server address
    .DESCRIPTION
        Gets the Centreon web server address
    .EXAMPLE
        Get-CentreonWebServer

        Returns the Centreon web server address
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonWebServer {
    [CmdletBinding()]
    $WebServer = Get-PSFConfigValue -FullName CentreonPowerShell.Centreon.WebServer
    if (-not $WebServer) {
        throw "Please use Set-CentreonWebServer (-Register)"
    }
    $WebServer
}