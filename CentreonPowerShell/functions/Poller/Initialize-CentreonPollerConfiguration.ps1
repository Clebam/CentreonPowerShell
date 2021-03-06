﻿<#
    .SYNOPSIS
        Generates the configuration files of a poller
    .DESCRIPTION
        Generates the configuration files of a poller
    .PARAMETER Id
        Id of the poller
    .PARAMETER Poller
        Name of the pooler
    .EXAMPLE
        Initialize-CentreonPollerConfiguration -Poller "Poller1"

        Generates the configuration files of the poller named Poller1
    .EXAMPLE
        Initialize-CentreonPollerConfiguration -Id 1

        Generates the configuration files of the poller with id 1
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Initialize-CentreonPollerConfiguration {
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
                Invoke-Centreon -Action POLLERGENERATE -Value $_poller -NonCsvOutput
            }
        }
        if ($PSCmdlet.ParameterSetName -eq "Id") {
            foreach ($_id in $Id) {
                Invoke-Centreon -Action POLLERGENERATE -Value $_id -NonCsvOutput
            }
        }
    }
    end {

    }
}