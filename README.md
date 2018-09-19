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

# Work In Progress - Translating 355 Commands ![Progress](http://progressed.io/bar/70?scale=359&title=Translated&suffix=+)
- Acl - Includes : [ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl.html), [Action ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_action.html), [Menu ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_menu.html), [Resource ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_resource.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Core - Includes : Module related functions
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/60?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/30?title=Testing)
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Poller - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Testing)

# To do

- Translate the command from CLAPI into PowerShell functions
- Design a better output so it can be pipelined
- ...

# Release

The module is not working yet.