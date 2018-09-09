<#
    .SYNOPSIS
        Runs a process and returns a System.Diagnostics.Process object
    .DESCRIPTION
        Runs a process and returns a System.Diagnostics.Process object
    .PARAMETER Process
        Name or Path of the process
    .PARAMETER Argument
        Argument of the process
    .EXAMPLE
        $Process = Invoke-Process -Process ping -Argument "localhost -4"
        $Process.StandardOutput.ReadToEnd()

        Call the process ping with arguments : localhost -4
        Then reads the StandardOutput
    .NOTES
        Author: Clebam
        Version: 1.0
#>
function Invoke-Process {
    param($Process, $Argument)
    $ProcessInfo = New-Object System.Diagnostics.ProcessStartInfo
    $ProcessInfo.FileName = $Process
    $ProcessInfo.RedirectStandardError = $true
    $ProcessInfo.RedirectStandardOutput = $true
    $ProcessInfo.UseShellExecute = $false
    $ProcessInfo.Arguments = $Argument
    $Process = New-Object System.Diagnostics.Process
    $Process.StartInfo = $ProcessInfo
    $Process.Start() | Out-Null
    $Process.WaitForExit()
    $Process
}