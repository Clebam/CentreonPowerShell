@{
	# Script module or binary module file associated with this manifest
	ModuleToProcess = 'CentreonPowerShell.psm1'

	# Version number of this module.
	ModuleVersion = '1.0.0.0'

	# ID used to uniquely identify this module
	GUID = 'dd9c2e54-3fc0-44a0-871f-4a88bf0e9fc2'

	# Author of this module
	Author = 'Clebam'

	# Company or vendor of this module
	CompanyName = 'BamShell'

	# Copyright statement for this module
	Copyright = 'Copyright (c) 2018 Clebam'

	# Description of the functionality provided by this module
	Description = 'A PowerShell module to wrap centreon commands'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.0'

	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules = @(
		@{ ModuleName='PSFramework'; ModuleVersion='0.9.25.113' }
	)

	# Assemblies that must be loaded prior to importing this module
	# RequiredAssemblies = @('bin\CentreonPowerShell.dll')

	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @('xml\CentreonPowerShell.Types.ps1xml')

	# Format files (.ps1xml) to be loaded when importing this module
	# FormatsToProcess = @('xml\CentreonPowerShell.Format.ps1xml')

	# Functions to export from this module
	FunctionsToExport = @('Add-CentreonHostCategoryMember',
	'Add-CentreonHostCG',
	'Add-CentreonHostContact',
	'Add-CentreonHostGroupMember',
	'Add-CentreonHostHG',
	'Add-CentreonHostHtpl',
	'Add-CentreonHostParent',
	'Add-CentreonHostTemplateCG',
	'Add-CentreonHostTemplateContact',
	'Add-CentreonHostTemplateHG',
	'Add-CentreonHostTemplateHtpl',
	'Add-CentreonTrapMatching',
	'Clear-CentreonHostCategorySeverity',
	'Clear-CentreonHostSeverity',
	'Clear-CentreonHostTemplateSeverity',
	'Disable-CentreonHost',
	'Disable-CentreonHostTemplate',
	'Enable-CentreonHost',
	'Enable-CentreonHostTemplate',
	'Export-CentreonConfiguration',
	'Get-CentreonApiToken',
	'Get-CentreonBinary',
	'Get-CentreonCommand',
	'Get-CentreonCredential',
	'Get-CentreonDependency',
	'Get-CentreonDependencyDefinition',
	'Get-CentreonHost',
	'Get-CentreonHostCategory',
	'Get-CentreonHostCategoryMember',
	'Get-CentreonHostCG',
	'Get-CentreonHostContact',
	'Get-CentreonHostGroup',
	'Get-CentreonHostGroupMember',
	'Get-CentreonHostHG',
	'Get-CentreonHostHtpl',
	'Get-CentreonHostMacro',
	'Get-CentreonHostParameter',
	'Get-CentreonHostParent',
	'Get-CentreonHostTemplate',
	'Get-CentreonHostTemplateCG',
	'Get-CentreonHostTemplateContact',
	'Get-CentreonHostTemplateHG',
	'Get-CentreonHostTemplateHtpl',
	'Get-CentreonHostTemplateMacro',
	'Get-CentreonHostTemplateParameter',
	'Get-CentreonInstance',
	'Get-CentreonInstanceHost',
	'Get-CentreonLdap',
	'Get-CentreonLdapServer',
	'Get-CentreonPoller',
	'Get-CentreonQueryType',
	'Get-CentreonServiceTemplate',
	'Get-CentreonSetting',
	'Get-CentreonTimePeriod',
	'Get-CentreonTimePeriodException',
	'Get-CentreonTrap',
	'Get-CentreonTrapMatching',
	'Get-CentreonVendor',
	'Get-CentreonWebServer',
	'Import-CentreonConfiguration',
	'Initialize-CentreonHostHtpl',
	'Initialize-CentreonPollerConfiguration',
	'Invoke-Centreon',
	'Invoke-CentreonPollerCommand',
	'Move-CentreonPollerConfiguration',
	'New-CentreonApiToken',
	'New-CentreonCommand',
	'New-CentreonDependency',
	'New-CentreonDependencyChild',
	'New-CentreonDependencyParent',
	'New-CentreonHost',
	'New-CentreonHostCategory',
	'New-CentreonHostGroup',
	'New-CentreonHostTemplate',
	'New-CentreonInstance',
	'New-CentreonLdap',
	'New-CentreonLdapServer',
	'New-CentreonTimePeriod',
	'New-CentreonTrap',
	'New-CentreonVendor',
	'Publish-CentreonPollerConfiguration',
	'Register-CentreonVendorTrap',
	'Remove-CentreonCommand',
	'Remove-CentreonDependency',
	'Remove-CentreonDependencyChild',
	'Remove-CentreonDependencyParent',
	'Remove-CentreonHost',
	'Remove-CentreonHostCategory',
	'Remove-CentreonHostCategoryMember',
	'Remove-CentreonHostCG',
	'Remove-CentreonHostContact',
	'Remove-CentreonHostGroup',
	'Remove-CentreonHostGroupMember',
	'Remove-CentreonHostHG',
	'Remove-CentreonHostHtpl',
	'Remove-CentreonHostMacro',
	'Remove-CentreonHostParent',
	'Remove-CentreonHostTemplate',
	'Remove-CentreonHostTemplateCG',
	'Remove-CentreonHostTemplateContact',
	'Remove-CentreonHostTemplateHG',
	'Remove-CentreonHostTemplateHtpl',
	'Remove-CentreonHostTemplateMacro',
	'Remove-CentreonInstance',
	'Remove-CentreonLdap',
	'Remove-CentreonLdapServer',
	'Remove-CentreonTimePeriod',
	'Remove-CentreonTimePeriodException',
	'Remove-CentreonTrap',
	'Remove-CentreonTrapMatching',
	'Remove-CentreonVendor',
	'Restart-CentreonPoller',
	'Set-CentreonBinary',
	'Set-CentreonCommandParameter',
	'Set-CentreonCredential',
	'Set-CentreonDependencyParameter',
	'Set-CentreonHostCategoryMember',
	'Set-CentreonHostCategorySeverity',
	'Set-CentreonHostCG',
	'Set-CentreonHostContact',
	'Set-CentreonHostGroupMember',
	'Set-CentreonHostGroupParameter',
	'Set-CentreonHostHG',
	'Set-CentreonHostHtpl',
	'Set-CentreonHostInstance',
	'Set-CentreonHostMacro',
	'Set-CentreonHostParameter',
	'Set-CentreonHostParent',
	'Set-CentreonHostSeverity',
	'Set-CentreonHostTemplateCG',
	'Set-CentreonHostTemplateContact',
	'Set-CentreonHostTemplateHG',
	'Set-CentreonHostTemplateHtpl',
	'Set-CentreonHostTemplateInstance',
	'Set-CentreonHostTemplateMacro',
	'Set-CentreonHostTemplateParameter',
	'Set-CentreonHostTemplateSeverity',
	'Set-CentreonInstanceParameter',
	'Set-CentreonLdapParameter',
	'Set-CentreonLdapServerParameter',
	'Set-CentreonQueryType',
	'Set-CentreonSettingParameter',
	'Set-CentreonTimePeriod',
	'Set-CentreonTimePeriodException',
	'Set-CentreonTrapMatching',
	'Set-CentreonTrapParameter',
	'Set-CentreonVendorParameter',
	'Set-CentreonWebServer',
	'Test-CentreonPollerConfiguration',
	'Update-CentreonPollet')

	# Cmdlets to export from this module
	CmdletsToExport = ''

	# Variables to export from this module
	VariablesToExport = ''

	# Aliases to export from this module
	AliasesToExport = ''

	# List of all modules packaged with this module
	ModuleList = @()

	# List of all files packaged with this module
	FileList = @()

	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{

		#Support for PowerShellGet galleries.
		PSData = @{

			# Tags applied to this module. These help with module discovery in online galleries.
			# Tags = @()

			# A URL to the license for this module.
			# LicenseUri = ''

			# A URL to the main website for this project.
			# ProjectUri = ''

			# A URL to an icon representing this module.
			# IconUri = ''

			# ReleaseNotes of this module
			# ReleaseNotes = ''

		} # End of PSData hashtable

	} # End of PrivateData hashtable
}