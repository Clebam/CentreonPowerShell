# Description

CentreonPowerShell module est conçu pour transcrire les commandes de centreon Command Line API (CLAPI) en syntaxe PowerShell.

L'idée est de pouvoir bénéficier de la puissance et de la simplicité de PowerShell, et d'avoir un outil simple pour ceux qui sont plus à l'aise avec le scripting Microsoft que Bash, Python ou Perl.

La sortie récente de PowerShell Core 6.0 sur les systèmes Linux permet désormais d'y utiliser PowerShell et malgré le manque de plusieurs fonctionnalités, ça fait bien le travail.

_Read this in other languages :_ [English](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.md), [Français](https://github.com/Clebam/CentreonPowerShell/blob/Development/README.FR.md)

__Exemples__
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

# Work In Progress - Traduction des 355 Commandes ![Progress](http://progressed.io/bar/70?scale=359&title=Translated&suffix=+)
- Acl - Includes : [ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl.html), [Action ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_action.html), [Menu ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_menu.html), [Resource ACL](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_resource.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- AclGroup - Includes : [ACL Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/acl_group.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- CentreonBrokerCfg - Includes : [Centreon broker](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/broker_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- CgiCfg - Includes : [CGI CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/cgi_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Command - Includes : [Commands](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/commands.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Contact - Includes : [Contacts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contacts.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ContactGroup - Includes : [Contact Groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ContactTemplate - Includes : [Contact templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/contact_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Core - Includes : Module related functions
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Dependency - Includes : [Dependencies](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/dependencies.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Downtime - Includes : [Downtimes](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/downtimes.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Host - Includes : [Hosts](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/hosts.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Translating)
	- [ ] ![Progress](http://progressed.io/bar/60?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/30?title=Tests)
- HostCategory - Includes : [Host categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- HostGroup - Includes : [Host groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_groups.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- HostTemplate - Includes : [Host templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_templates.html)
	- [x] ![Progress](http://progressed.io/bar/100?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Instance - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- LdapCfg - Includes : [LDAP configuration](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ldap_servers.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- NagiosCfg - Includes : [Nagios CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/nagios_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Ndo2dbCfg - Includes : [Ndo2db CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndo2db_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- NdomodCfg - Includes : [Ndomod CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/ndomod_cfg.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Poller - Includes : [Instances (Pollers)](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/instances.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ResourceCfg - Includes : [Resource CFG](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/resource_cfg.htm)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Service - Includes : [Services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/services.html), [Host group services](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/host_group_services.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ServiceCategory - Includes : [Service categories](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_categories.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ServiceGroup - Includes : [Service groups](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_groups.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- ServiceTemplate - Includes : [Service templates](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/service_templates.html)
	- [ ] ![Progress](http://progressed.io/bar/3?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Settings - Includes : [Settings](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/settings.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- TimePeriod - Includes : [Time periods](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/time_periods.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Trap - Includes : [Traps](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/traps.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)
- Vendor - Includes : [Vendors](https://documentation.centreon.com/docs/centreon-clapi/en/latest/objects/vendors.html)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Traduction)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Contrôle)
	- [ ] ![Progress](http://progressed.io/bar/0?title=Tests)

# To do

- Transcrire les commandes de CLAPI en fonctions PowerShell
- Concevoir un meilleur output des fonctions afin de pouvoir utiliser le pipeline
- ...

# Release

Le module ne fonctionne pas encore.