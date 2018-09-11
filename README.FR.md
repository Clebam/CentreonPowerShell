# Description

CentreonPowerShell module est conçu pour transcrire les commandes de centreon Command Line API (CLAPI) en syntaxe PowerShell.

L'idée est de pouvoir bénéficier de la puissance et de la simplicité de PowerShell, et d'avoir un outil simple pour ceux qui sont plus à l'aise avec le scripting Microsoft que Bash, Python ou Perl.

La sortie récente de PowerShell Core 6.0 sur les systèmes Linux permet désormais d'y utiliser PowerShell et malgré le manque de plusieurs fonctionnalités, ça fait bien le travail.

_Read this in other languages :_ [English](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.md), [Français](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.FR.md)

__Exemple__
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
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Core - Includes : Module related functions
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/10?title=Contrôle )
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle )

# To do

- Transcrire les commandes de CLAPI en fonctions PowerShell
- Concevoir un meilleur output des fonctions afin de pouvoir utiliser le pipeline
- ...

# Release

Le module ne fonctionne pas encore.