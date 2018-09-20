<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Credential' -Value $null -Initialize -Description "Credential (UserName and Password combination) to access centreon web interface. Use Get-Credential to generate one."
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.Binary' -Value "centreon" -Initialize -Validation 'string' -Handler { } -Description "This is the name of the binary."
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.WebServer' -Value "localhost" -Initialize -Validation 'string' -Handler { } -Description "This is the address or url of Centreon Web."
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.ApiToken' -Value $null -Initialize -Description "This is the address or url of Centreon Web."
Set-PSFConfig -Module 'CentreonPowerShell' -Name 'Centreon.QueryType' -Value "Binary" -Initialize -Validation 'string' -Handler { } -Description "Sets the way query will be sent to Centreon (API or Binary)"