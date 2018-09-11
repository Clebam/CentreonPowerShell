<#
    .SYNOPSIS
        Returns the parents of a host
    .DESCRIPTION
        Returns the parents of a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostParent -HostName "WebMdz01"

        Returns the parents of the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostParent {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [Alias("Name")]
		[string] $HostName
    )
    Invoke-Centreon -Object HOST -Action GETPARENT -Value $HostName
}