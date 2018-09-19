<#
    .SYNOPSIS
        Removes an existing hostgroup
    .DESCRIPTION
        Removes an existing hostgroup
    .PARAMETER HostGroup
        Corresponds to the name of the hostgroup
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonHost -HostGroup "WebServers"

        Removes the host WebServers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonHost {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostGroup
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($HostGroup)) {
            foreach ($_hostgroup in $HostGroup) {
                Invoke-Centreon -Object HG -Action DEL -Value $_hostgroup
            }
        }
    }
    end {

    }
}