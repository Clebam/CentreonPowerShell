@{
	# Script module or binary module file associated with this manifest
	ModuleToProcess = 'CentreonPowerShell.psm1'
	
	# Version number of this module.
	ModuleVersion = '1.0.0.0'
	
	# ID used to uniquely identify this module
	GUID = 'dd9c2e54-3fc0-44a0-871f-4a88bf0e9fc2'
	
	# Author of this module
	Author = 'maitr'
	
	# Company or vendor of this module
	CompanyName = 'MyCompany'
	
	# Copyright statement for this module
	Copyright = 'Copyright (c) 2018 maitr'
	
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
	FunctionsToExport = @(
	'Add-CentreonHostTemplate',
	'Disable-CentreonHost',
	'Enable-CentreonHost',
	'Get-CentreonCommand',
	'Get-CentreonCredential',
	'Get-CentreonHost',
	'Get-CentreonHostContact',
	'Get-CentreonHostContactGroup',
	'Get-CentreonHostHG',
	'Get-CentreonHostMacro',
	'Get-CentreonHostParam',
	'Get-CentreonHostParent',
	'Get-CentreonHostTemplate',
	'Get-CentreonHtpl',
	'Get-CentreonServiceTemplate',
	'Initialize-CentreonHostTemplate',
	'Invoke-Centreon',
	'New-CentreonHost',
	'New-CentreonHostGroup',
	'New-CentreonSession',
	'Remove-CentreonHost',
	'Remove-CentreonHostMacro',
	'Remove-CentreonHostTemplate',
	'Set-CentreonCredential',
	'Set-CentreonHostInstance',
	'Set-CentreonHostMacro',
	'Set-CentreonHostParam',
	'Set-CentreonHostTemplate')
	
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
