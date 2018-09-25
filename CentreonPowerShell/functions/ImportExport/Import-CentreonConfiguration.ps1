<#
    .SYNOPSIS
        Imports a full centreon configuration from a file.
    .DESCRIPTION
        Imports a full centreon configuration from a file.
    .PARAMETER Path
        Name of the host
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Import-CentreonConfiguration -Path "/tmp/centreoncfg.txt"

        Imports the configuration stored in /tmp/centreoncfg.txt
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Import-CentreonConfiguration {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $Path
    )
    if ($PSCmdlet.ShouldProcess($Path)) {
        Invoke-Centreon -ManagementAction Import -Path $Path -NonCsvOutput
    }
}