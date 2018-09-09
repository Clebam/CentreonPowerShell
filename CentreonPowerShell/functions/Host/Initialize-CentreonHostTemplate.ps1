<#
    .SYNOPSIS
        Applies templates linked to a host
    .DESCRIPTION
        Applies templates linked to a host
    .PARAMETER HostName
        Name of the host
    .EXAMPLE
        Initialize-CentreonHostTemplate -HostName "WebMdz01"

        Applies all the templates (implies it creates the services) bound to the host WebMdz01
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Initialize-CentreonHostTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $HostName
    )
    Invoke-Centreon -Object HOST -Action APPLYTPL -Value $HostName
}