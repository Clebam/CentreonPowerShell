<#
    .SYNOPSIS
        Sets the url or ip address to reach Centreon Web
    .DESCRIPTION
        Sets the url or ip address to reach Centreon Web
    .PARAMETER WebServer
        URL or IP Address of Centreon Web
    .PARAMETER Register
        Register the WebServer to a configuration file
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
    Set-CentreonWebServer -WebServer https://192.168.1.100 -Register

    Sets webserver and stores then in a configuration file
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Set-CentreonWebServer {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $WebServer,
        [switch] $Register
    )
    if ($PSCmdlet.ShouldProcess("Config")) {
        Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.WebServer' -Value $WebServer
        if ($Register) {
            Register-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.WebServer'
        }
    }
}