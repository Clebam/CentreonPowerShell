<#
    .SYNOPSIS
        Creates an API Token for Centreon Web
    .DESCRIPTION
        Creates an API Token for Centreon Web
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
    New-CentreonApiToken

    Creates an ApiToken and keeps it in memory
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function New-CentreonApiToken {
    [CmdletBinding(SupportsShouldProcess)]
    param(
    )
    if ($PSCmdlet.ShouldProcess("Config")) {
        $WebServer = Get-CentreonWebServer
        $CentreonCredential = Get-CentreonCredential

        $Body = @{
            "username" = "$($CentreonCredential.UserName)"
            "password" = "$($CentreonCredential.Password)"
        }

        $URL = "$WebServer/centreon/api/index.php?"

        try {
            $Authentication = (Invoke-WebRequest  -Uri "$($URL)action=authenticate"  -Method Post -Body $Body)
        }
        catch {
            throw "An error occured during the authentication process : $_"
        }

        $authToken = ($Authentication | ConvertFrom-Json).authToken
        $ApiToken = @{}
        $ApiToken.Add("centreon-auth-token", "$authToken")

        Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.ApiToken' -Value $ApiToken
    }
}