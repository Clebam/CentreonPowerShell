<#
    .SYNOPSIS
        Removes an existing vendor
    .DESCRIPTION
        Removes an existing vendor
    .PARAMETER Vendor
        Corresponds to the name of the vendor
    .PARAMETER Confirm
        Prompts to confirm the action
    .PARAMETER WhatIf
        Performs the action as a test
    .EXAMPLE
        Remove-CentreonVendor -Vendor "DLink"

        Removes the vendor DLink
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Remove-CentreonVendor {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline)]
        [ValidateNotNullOrEmpty()]
        [string[]] $Vendor
    )
    begin {

    }
    process {
        if ($PSCmdlet.ShouldProcess($Vendor)) {
            foreach ($_vendor in $Vendor) {
                Invoke-Centreon -Object VENDOR -Action DEL -Value $_vendor
            }
        }
    }
    end {

    }
}