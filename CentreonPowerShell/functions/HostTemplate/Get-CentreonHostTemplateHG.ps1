<#
    .SYNOPSIS
        Returns the hostgroups that a host template is linked to
    .DESCRIPTION
        Returns the hostgroups that a host template is linked to
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Get-CentreonHostTemplateHG -HostTemplate "Webservers"

        Returns the hostgroups that the host templates Webservers is linked to
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplateHG {
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
                HostGroupName  = Invoke-Centreon -Object HTPL -Action GETHOSTGROUP -Value $_hosttemplate | Select-Object -ExpandProperty name
            }
            $PSObject
        }
    }
    end {

    }
}