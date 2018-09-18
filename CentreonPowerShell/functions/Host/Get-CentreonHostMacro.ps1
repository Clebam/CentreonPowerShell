<#
    .SYNOPSIS
        Returns the macros of a host
    .DESCRIPTION
        Returns the macros of a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostMacro -HostName "WebMdz01"

        Returns the macros of the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostMacro {
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
            $PSObject = [PSCustomObject]@{
                HostName  = $_hostname -as [string]
                MacroName = Invoke-Centreon -Object HOST -Action GETMACRO -Value $_hostname | Select-Object -ExpandProperty "macro name"
            }
            $PSObject
        }
    }
    end {

    }
}