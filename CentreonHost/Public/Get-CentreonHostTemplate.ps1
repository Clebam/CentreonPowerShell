<#
    .SYNOPSIS
        Returns the templates bound to a host
    .DESCRIPTION
        Returns the macros bound to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Get-CentreonHostTemplate -HostName "WebMdz01"
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonHostTemplate {
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
        Invoke-Centreon -Object HOST -Action GETTEMPLATE -Value $HostName
}