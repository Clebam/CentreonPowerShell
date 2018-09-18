<#
    .SYNOPSIS
        Returns the contacts linked to a host template
    .DESCRIPTION
        Returns the contacts linked to a host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Get-CentreonHostTemplateContact -HostTemplate "Webservers"

        Returns the contacts linked to the host template Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplateContact {
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
                Contact      = Invoke-Centreon -Object HTPL -Action GETCONTACT -Value $_hosttemplate | Select-Object -Expand Name
            }
            $PSObject
        }
    }
    end {

    }
}