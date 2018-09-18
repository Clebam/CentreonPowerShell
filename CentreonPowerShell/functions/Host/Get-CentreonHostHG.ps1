<#
    .SYNOPSIS
        Returns the hostgroups that a host is linked to
    .DESCRIPTION
        Returns the hostgroups that a host is linked to
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostHG -HostName "WebMdz01"

        Returns the hostgroups that WebMdz01 is linked to
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostHG {
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
                HostName = $_hostname -as [string]
                HostGroupName  = Invoke-Centreon -Object HOST -Action GETHOSTGROUP -Value $_hostname | Select-Object -ExpandProperty name
            }
            $PSObject
        }
    }
    end {

    }
}