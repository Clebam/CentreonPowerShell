<#
    .SYNOPSIS
        Returns the contacts linked to a host
    .DESCRIPTION
        Returns the contacts linked to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostContact -HostName "WebMdz01"

        Returns the contacts linked to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostContact {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action GETCONTACT -Value $HostName
}