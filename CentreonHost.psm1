#region Externalisation des fonctions
$ModuleFolder="CentreonHost"
$Public  = @( Get-ChildItem -Path $PSScriptRoot\$ModuleFolder\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\$ModuleFolder\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )
#Dot source the files
Foreach ($import in @($Public + $Private)) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# On exporte les fonctions publiques. (Elles seront disponibles automatiquement si le module est disponible, sans avoir � charger le module.)
Export-ModuleMember -Function $Public.Basename
#endregion