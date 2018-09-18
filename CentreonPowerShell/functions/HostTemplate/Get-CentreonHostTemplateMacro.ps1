<#
    .SYNOPSIS
        Returns the macros of a host template
    .DESCRIPTION
        Returns the macros of a host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Get-CentreonHostTemplateMacro -HostTemplate "Webservers"

        Returns the macros of the host template Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplateMacro {
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
            $PSObject = [PSCustomObject]@{
                HostTemplate = $_hosttemplate -as [string]
                MacroName    = Invoke-Centreon -Object HTPL -Action GETMACRO -Value $_hosttemplate | Select-Object -ExpandProperty "macro name"
            }
            $PSObject
        }
    }
    end {

    }
}