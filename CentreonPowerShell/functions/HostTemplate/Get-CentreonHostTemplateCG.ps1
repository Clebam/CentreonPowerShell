<#
    .SYNOPSIS
        Returns the contact groups linked to a host template
    .DESCRIPTION
        Returns the contact groups linked to a host template
    .PARAMETER HostTemplate
        Name of the host template
    .EXAMPLE
        Get-CentreonHostTemplateCG -HostTemplate "Webservers"

        Returns the contact groups linked to the host template Webservers
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplateCG {
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
                HostTemplate     = $_hosttemplate -as [string]
                ContactGroup = Invoke-Centreon -Object HTPL -Action GETCONTACTGROUP -Value $_hosttemplate | Select-Object -Expand Name
            }
            $PSObject
        }
    }
    end {

    }
}