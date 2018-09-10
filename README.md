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
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Core - Includes : Module related functions
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] Translating 100 %
	- [ ] Controlling 10 %
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [ ] Translating 3 %
	- [ ] Controlling 0 %
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] Translating 3 %
	- [ ] Controlling 0 %
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] Translating 0 %
	- [ ] Controlling 0 %

# To do

- Translate the command from CLAPI into PowerShell functions
- Design a better output so it can be pipelined
- ...

# Release

The module is not working yet.