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
# Work In Progress (2%)
- Acl - Includes : [ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl.html), [Action ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_action.html), [Menu ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_menu.html), [Resource ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_resource.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Core - Includes : Module related functions
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)   
	- [ ] ![Progress](http://progressed.io/bar/10?title=Controlling )     
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Translating )     
	- [ ] ![Progress](http://progressed.io/bar/0?title=Controlling )     

# To do

- Translate the command from CLAPI into PowerShell functions
- Design a better output so it can be pipelined
- ...

# Release

The module is not working yet.