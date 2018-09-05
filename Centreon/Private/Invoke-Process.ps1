function Invoke-Process {
    param($Process, $Arguments)
    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $Process
    $pinfo.RedirectStandardError = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute = $false
    $pinfo.Arguments = $Arguments
    $p = New-Object System.Diagnostics.Process
    $p.StartInfo = $pinfo
    $p.Start() | Out-Null
    $p.WaitForExit()
    $p
}