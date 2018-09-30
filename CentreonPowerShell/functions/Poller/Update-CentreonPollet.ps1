<#
    .SYNOPSIS
        Reloads the configuration files of a poller
    .DESCRIPTION
        Reloads the configuration files of a poller
    .PARAMETER Id
        Id of the poller
    .PARAMETER Poller
        Name of the poller
    .EXAMPLE
        Update-CentreonPoller -Poller "Poller1"

       Reloads the poller named Poller1
    .EXAMPLE
        Update-CentreonPoller -Id 1

        Reloads the poller with id 1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Update-CentreonPoller {
    [CmdletBinding(DefaultParameterSetName = "Name")]
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
            foreach ($_poller in $Poller) {
                Invoke-Centreon -Action POLLERRELOAD -Value $_poller -NonCsvOutput
            }
        }
        if ($PSCmdlet.ParameterSetName -eq "Id") {
            foreach ($_id in $Id) {
                Invoke-Centreon -Action POLLERRELOAD -Value $_id -NonCsvOutput
            }
        }
    }
    end {

    }
}