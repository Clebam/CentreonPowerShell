<#
    .SYNOPSIS
        Applies the configuration files of a poller (corresponds to Initialize + Test + Move + Update)
    .DESCRIPTION
        Applies the configuration files of a poller (corresponds to Initialize + Test + Move + Update)
    .PARAMETER Id
        Id of the poller
    .PARAMETER Poller
        Name of the pooler
    .EXAMPLE
        Publish-CentreonPollerConfiguration -Poller "Poller1"

        Applies the configuration files of the poller named Poller1
    .EXAMPLE
        Publish-CentreonPollerConfiguration -Id 1

        Applies the configuration files of the poller with id 1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Publish-CentreonPollerConfiguration {
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
                Invoke-Centreon -Action APPLYCFG -Value $_poller -NonCsvOutput
            }
        }
        if ($PSCmdlet.ParameterSetName -eq "Id") {
            foreach ($_id in $Id) {
                Invoke-Centreon -Action APPLYCFG -Value $_id -NonCsvOutput
            }
        }
    }
    end {

    }
}