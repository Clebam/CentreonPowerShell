# Description

CentreonPowerShell module is designed to wrap the centreon Command Line API (CLAPI) into PowerShell Syntax.

The general idea is to benefit from PowerShell's strength and ease of use, and also to help people that know better Microsoft's scripting than Bash, Python or Perl.

The recent release of PowerShell Core 6.0 on Linux systems allows to use PowerShell now, and even though it still lacks some features, it gets the job done.

_Read this in other languages :_ [English](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.md), [Français](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.FR.md)

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
[ ] Acl [ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl.html){:target="_blank"}
[ ] AclGroup
[ ] CentreonBrokerCfg
[ ] CgiCfg
[ ] Command
[ ] Contact
[ ] ContactGroup
[ ] Core
[ ] Dependency
[ ] Downtime
[x] Host
[ ] HostCategory
[ ] HostGroup
[ ] HostTemplate
[ ] Instance
[ ] LdapCfg
[ ] NagiosCfg
[ ] Ndo2dbCfg
[ ] NdomodCfg
[ ] ResourceCfg
[ ] Service
[ ] ServiceCategory
[ ] ServiceGroup
[ ] ServiceTemplate
[ ] Settings
[ ] TimePeriod
[ ] Trap
[ ] Vendor


# To do

- Translate the command from CLAPI into PowerShell functions
- Design a better output so it can be pipelined
- ...

# Release

The module is not working yet.