<#
    .SYNOPSIS
        Enable a disabled host template
    .DESCRIPTION
        Enable a disabled host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Enable-CentreonHostTemplate -HostTemplate "WebServers"

        It enables the host template WebServers (Parameter activate=1)
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Enable-CentreonHostTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostTemplate
    )
    begin {

    }
    process {
        foreach ($_hosttemplate in $HostTemplate) {
            Invoke-Centreon -Object HTPL -Action ENABLE -Value $_hosttemplate
        }
    }
    end {

    }
}