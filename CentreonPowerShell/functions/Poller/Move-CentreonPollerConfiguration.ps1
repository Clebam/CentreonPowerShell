<#
    .SYNOPSIS
        Moves the configuration files of a poller
    .DESCRIPTION
        Moves the configuration files of a poller
    .PARAMETER Id
        Id of the poller
    .PARAMETER Poller
        Name of the pooler
    .EXAMPLE
        Move-CentreonPollerConfiguration -Poller "Poller1"

        Moves the configuration files of the poller named Poller1
    .EXAMPLE
        Move-CentreonPollerConfiguration -Id 1

        Moves the configuration files of the poller with id 1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Move-CentreonPollerConfiguration {
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
                Invoke-Centreon -Action CFGMOVE -Value $_poller -NonCsvOutput
            }
        }
        if ($PSCmdlet.ParameterSetName -eq "Id") {
            foreach ($_id in $Id) {
                Invoke-Centreon -Action CFGMOVE -Value $_id -NonCsvOutput
            }
        }
    }
    end {

    }
}