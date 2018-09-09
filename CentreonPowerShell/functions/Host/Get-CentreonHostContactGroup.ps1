<#
    .SYNOPSIS
        Returns the contactgroups linked to a host
    .DESCRIPTION
        Returns the contactgroups linked to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostContactGroup -HostName "WebMdz01"

        Returns the contact groups linked to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostContactGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action GETCONTACTGROUP -Value $HostName
}