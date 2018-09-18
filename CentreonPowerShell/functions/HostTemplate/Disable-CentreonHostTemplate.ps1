<#
    .SYNOPSIS
        Disable a enabled host template
    .DESCRIPTION
        Disable a enabled host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Disable-CentreonHostTemplate -HostTemplate "WebServers"

        It disables the host template WebServers (Parameter activate=0)
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Disable-CentreonHostTemplate {
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
            Invoke-Centreon -Object HTPL -Action DISABLE -Value $_hosttemplate
        }
    }
    end {

    }
}