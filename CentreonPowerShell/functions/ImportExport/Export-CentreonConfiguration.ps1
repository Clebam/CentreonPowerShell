<#
    .SYNOPSIS
        Exports a full centreon configuration to a file.
    .DESCRIPTION
        Exports a full centreon configuration to a file.
    .PARAMETER Path
        Name of the host
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Export-CentreonConfiguration -Path "/tmp/centreoncfg.txt"

        Exports the configuration stored to /tmp/centreoncfg.txt
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Export-CentreonConfiguration {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string] $Path
    )
    if ($PSCmdlet.ShouldProcess($Path)) {
        Invoke-Centreon -ManagementAction Export -Path $Path -NonCsvOutput | Out-File -FilePath $Path
    }
}