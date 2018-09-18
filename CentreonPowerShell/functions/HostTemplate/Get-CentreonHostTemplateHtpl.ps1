<#
    .SYNOPSIS
        Returns the parent host templates bound to a host template
    .DESCRIPTION
        Returns the parent host templates bound to a host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Get-CentreonHostTemplateHtpl -HostTemplate "Webservers"

        Returns the templates bound to Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplateHtpl {
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
                ParentHostTemplate  = Invoke-Centreon -Object HTPL -Action GETTEMPLATE -Value $_hosttemplate | Select-Object -ExpandProperty name
            }
            $PSObject
        }
    }
    end {

    }
}