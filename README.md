# Description

CentreonPowerShell module is designed to wrap the centreon Command Line API (CLAPI) into PowerShell Syntax.

The general idea is to benefit from PowerShell's strength and ease of use, and also to help people that know better Microsoft's scripting than Bash, Python or Perl.

The recent release of PowerShell Core 6.0 on Linux systems allows to use PowerShell now, and even though it still lacks some features, it gets the job done.

_Read this in other languages :_ [English](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.md), [Français](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.FR.md)

__Examples__
```PowerShell
PS /root> Import-Module CentreonPowerShell

PS /root> Set-CentreonCredential

cmdlet Set-CentreonCredential at command pipeline position 1
Supply values for the following parameters:
Credential
User: admin
Password for user admin: ********

PS /root> Get-CentreonHost


HostName : WebMdz01
id       : 23
alias    : Mamoudzou WebServer
address  : 192.168.1.24
activate : 1

HostName : WebCoco01
id       : 24
alias    : Coconi WebServer
address  : 192.168.1.25
activate : 1
```

```PowerShell
PS /root> Get-CentreonHost WebMdz01 | Get-CentreonHostHG

HostName HostGroup
-------- ---------
WebMdz01 WebServerGroup


PS /root> Get-CentreonHost WebMdz01 | Get-CentreonHostHG | Get-CentreonHostGroupMember

HostGroup      HostName
---------      --------
WebServerGroup {WebMdz01, WebCoco01}

```

# Work In Progress - Translating
See the project : [Project](https://github.com/Clebam/CentreonPowerShell/projects/1)
See the milestones : [MileStones](https://github.com/Clebam/CentreonPowerShell/milestone/2)

# To do

- Translate the command from CLAPI into PowerShell functions
- Stengthen pipelining design
- Create useful function like `Get-CentreonHost -full` that would return all the info linked to the Host
- Review Comment Based Help to make them consistent
- Test, test, test again...

# Release

The module is not working yet.
