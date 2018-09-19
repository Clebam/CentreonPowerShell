<#
    .SYNOPSIS
        Returns the members of a host category
    .DESCRIPTION
        Returns the members of a host category
    .PARAMETER HostCategory
        Name of the host category
    .EXAMPLE
        Get-CentreonHostCategoryMember -HostCategory WebServer_Critical

        Returns all the members of the host category WebServer_Critical
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostCategoryMember {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $HostCategory
    )
    begin {

    }
    process {
        foreach ($_hostcategory in $HostCategory) {
            $PSObject = [PSCustomObject]@{
                HostCategory = $_hostgroup -as [string]
                Member       = Invoke-Centreon -Object HC -Action GETMEMBER -Value $_hostcategory | Select-Object -ExpandProperty "name"
            }
            $PSObject
        }
    }
    end {

    }
}