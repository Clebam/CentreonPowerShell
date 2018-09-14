<#
    .SYNOPSIS
        Returns the templates bound to a host
    .DESCRIPTION
        Returns the templates bound to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostHtpl -HostName "WebMdz01"

        Returns the templates bound to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostHtpl {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
        [string[]] $HostName
    )
    begin {

    }
    process {
        foreach ($_hostname in $HostName) {
            $PSObject = [PSCustomObject]@{
                HostName = $HostName -as [string]
                HostTemplate  = Invoke-Centreon -Object HOST -Action GETTEMPLATE -Value $_hostname | Select-Object -ExpandProperty name
            }
            $PSObject
        }
    }
    end {

    }
}