<#
    .SYNOPSIS
        Returns the contact groups linked to a host
    .DESCRIPTION
        Returns the contact groups linked to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostCG -HostName "WebMdz01"

        Returns the contact groups linked to WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostCG {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string] $HostName
    )
    Invoke-Centreon -Object HOST -Action GETCONTACTGROUP -Value $HostName
}