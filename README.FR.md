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

# Work In Progress - Traduction
__En suspens pour le moment : Centreon fait un upgrade de clapi et j'attends de voir les impacts sur ce projet__

Voir le projet : [Project](https://github.com/Clebam/CentreonPowerShell/projects/1)

Voir les milestones : [MileStones](https://github.com/Clebam/CentreonPowerShell/milestone/1)

# To do

- Transcrire les commandes de CLAPI en fonctions PowerShell
- Renforcer le design des output pour le pipelining
- Créer des fonctions utiles comme `Get-CentreonHost -Full` qui retournerait toutes les infos liés à un hôte
- Revoir les aides des fonctions pour maintenir une certaine cohérence
- Tester, tester et... tester encore!

# Release

Le module ne fonctionne pas encore.

# Remerciements
- Friedrich Weinmann (aka Fred) pour son framework PSModuleDevelopment - Visitez son [repository](https://github.com/PowershellFrameworkCollective/PSModuleDevelopment)
- Florian Clisson pour son module CentreonPS - Visitez son [repository](https://github.com/ClissonFlorian/Centreon-Powershell-Module)