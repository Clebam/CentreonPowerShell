﻿<#
    .SYNOPSIS
        Enable a disabled host
    .DESCRIPTION
        Enable a disabled host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Enable-CentreonHost -HostName "WebMdz01"

        It enables the host WebMdz (Parameter activate=1)
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Enable-CentreonHost {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostName
    )
    begin {

    }
    process {
        foreach ($_hostname in $HostName) {
            Invoke-Centreon -Object HOST -Action ENABLE -Value $_hostname
        }
    }
    end {

    }
}