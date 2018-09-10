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
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Core - Includes : Module related functions
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] Traduction 100 %
	- [ ] Contrôle 10 %
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [ ] Traduction 3 %
	- [ ] Contrôle 0 %
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] Traduction 3 %
	- [ ] Contrôle 0 %
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] Traduction 0 %
	- [ ] Contrôle 0 %

# To do

- Transcrire les commandes de CLAPI en fonctions PowerShell
- Concevoir un meilleur output des fonctions afin de pouvoir utiliser le pipeline
- ...

# Release

Le module ne fonctionne pas encore.