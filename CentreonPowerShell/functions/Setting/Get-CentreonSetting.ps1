<#
    .SYNOPSIS
        Returns a list of the editable settings of Centreon
    .DESCRIPTION
        Returns a list of the editable settings of Centreon
    .EXAMPLE
        Get-CentreonSetting

        Returns a list of the editable settings of Centreon
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Get-CentreonSetting {
    Invoke-Centreon -Object SETTINGS -Action SHOW | Select-Object @{Name = "Vendor"; Expression = {$_.Name}}, * -ExcludeProperty Name
}