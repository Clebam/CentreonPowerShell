<#
    .SYNOPSIS
        Restarts the configuration files of a poller
    .DESCRIPTION
        Restarts the configuration files of a poller
    .PARAMETER Id
        Id of the poller
    .PARAMETER Poller
        Name of the poller
    .EXAMPLE
        Restart-CentreonPoller -Poller "Poller1"

       Restarts the poller named Poller1
    .EXAMPLE
        Restart-CentreonPoller -Id 1

        Restarts the poller with id 1
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Restart-CentreonPoller {
    [CmdletBinding(DefaultParameterSetName = "Name", SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, ParameterSetName = "Name")]
        [ValidateNotNullOrEmpty()]
        [string[]] $Poller,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, ParameterSetName = "Id")]
        [ValidateNotNullOrEmpty()]
        [string[]] $Id
    )
    begin {

    }
    process {
        if ($PSCmdlet.ParameterSetName -eq "Name") {
            if ($PSCmdlet.ShouldProcess($Poller)) {
                foreach ($_poller in $Poller) {
                    Invoke-Centreon -Action POLLERRESTART -Value $_poller -NonCsvOutput
                }
            }
        }
        if ($PSCmdlet.ParameterSetName -eq "Id") {
            if ($PSCmdlet.ShouldProcess($Id)) {
                foreach ($_id in $Id) {
                    Invoke-Centreon -Action POLLERRESTART -Value $_id -NonCsvOutput
                }
            }
        }
    }
    end {

    }
}