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

# Work In Progress

- Transcrire les commandes de CLAPI en fonctions PowerShell 
- Concevoir un meilleur output des fonctions afin de pouvoir utiliser le pipeline
- ...

# Release

Le module ne fonctionne pas encore.