# Description

CentreonPowerShell module is designed to wrap the centreon Command Line API (CLAPI) into PowerShell Syntax.

The general idea is to benefit from PowerShell's strength and ease of use, and also to help people that know better Microsoft's scripting than Bash, Python or Perl.

The recent release of PowerShell Core 6.0 on Linux systems allows to use PowerShell now, and even though it still lacks some features, it gets the job done.

__Example__
```
PS /root> Get-CentreonHost | Select-Object name

name
----
CentreonCentral
Server001
Server002
Switch01


PS /root> Get-CentreonHost | Where-Object activate -eq 0 | Enable-CentreonHost
```

# Work In Progress

- Translate the command from CLAPI into PowerShell functions
- Design a better output so it can be pipelined
- ...

# Release

The module is not working yet.