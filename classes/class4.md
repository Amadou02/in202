---
layout: slideshow
title: Git
subtitle: Contrôle de versions
---

<section>

## Le terminal

Attention ! Le *contrôle de versions* est un outil de geeks.

- Il existe des *interfaces graphiques*, mais elles sont rarement
  complètes.

- Les docs font souvent référence à l'*interface en mode texte*.

Nous allons être obligés de toucher au **terminal** (invite de
commande, *shell*, *command prompt*, ...).

- Évolution des *teleprinters* (années '60).
- Prédominants jusqu'aux années '80.
- Toujours largement utilisés par les *power users*.

</section>
<section>

## Terminal Linux

![](http://upload.wikimedia.org/wikipedia/commons/2/29/Linux_command-line._Bash._GNOME_Terminal._screenshot.png){: width="650"}
{:.centered}

</section>
<section>

## Terminal OS X

![](http://upload.wikimedia.org/wikipedia/commons/4/40/Fink-MacOSX-Terminal.png){: width="600"}
{:.centered}

</section>
<section>

## Terminal Windows <small>(PowerShell)</small>

![](http://upload.wikimedia.org/wikipedia/commons/7/71/PowerShell_registry_provider.png){: width="700"}
{:.centered}

</section>
<section>


## Terminal Hollywood

<iframe width="800" height="450" src="https://www.youtube.com/embed/RfiQYRn7fBg?html5=1&showinfo=0&rel=0" frameborder="0" allowfullscreen></iframe>

</section>
<section>
<style >
@keyframes blinker {
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}
@-webkit-keyframes blinker {
  0% { opacity: 1.0; }
  50% { opacity: 0.0; }
  100% { opacity: 1.0; }
}
  
#cursor {
  animation: blinker 1s step-end infinite;
  -webkit-animation: blinker 1s step-end infinite;
}
html[data-incremental="1"] #usr,
html[data-incremental="2"] #host,
html[data-incremental="3"] #pwd,
html[data-incremental="4"] #cursor {
  background-color: red;
}
</style>

## Concepts clefs

- *Prompt* (invite)

<pre class="css">
<span id="usr">user</span>@<span id="host">host</span>:<span id="pwd">/home/user/dir</span>$ <span id="cursor">_</span>
</pre>

- Utilisateur (droits d'accès, etc.),
- Machine hôte (peut être une machine distante),
- Dossier courant,
- Attente des commandes.
{:.incremental}

### Commandes principales

- Naviguer et modifier les dossiers : `ls`, `cd`, `rm`, `mdkir`, `rmdir`, ...
- Interroger les ressources du système : processus, hardware, ...
- Exécuter des programmes (nom du programme),
- Automatiser des commandes (scripting).

</section>
<section>

## Terminal sur votre ordinateur

### Unix (Linux, Mac)

- Installé par défaut, des nombreux langages de scripting (par ex.: bash).

### Windows

- *Invite de commande* installé par défaut.

- Il est conseillé d'installer
  [*PowerShell*](https://technet.microsoft.com/scriptcenter/powershell.aspx),
  développé par Microsoft et distribué gratuitement.

- Il existe aussi des émulateurs de terminal Unix (MinGW, CygWin).

</section>
<section>

# Contrôle de versions

</section>
<section>

## Contrôle de versions

Gérer l'évolution d'un projet dont les *artefacts* sont **décrits
textuellement**, et généralement **produits par des humains**.

### Garder un historique

- Publier des versions incrémentales du projet.
- Défaire des changements récents, rappliquer des changements anciens.
- Comparer des versions, trouver le point d'introduction d'un bug.

### Collaborer (à distance)

- Synchroniser.
- Éditer simultanément.
- Résoudre les conflits.

</section>
<section>

## VCS populaires

### (VCS = Version Control System)

- **CVS** (Concurrent Versions System): 1990. Un des premiers
  VCS. Développé par Dick Grune à la Vrije Universiteit. Open source.
  
- **SVN** (Apache Subversion): 2000. Développé par CollabNet. Open
  source.

- **Git**: 2005. VCS *distribué*. Développé par Linus Thorvald pour
  gérer les sources de Linux. Open source.

Quelques autres VCS: Mercurial (python), Bazaar (python), Darcs
(Haskell), BitKeeper (propriétaire), Monotone, ...

</section>
<section>

## Concepts clefs

- **Répertoire** sous VCS : un *dossier* contenant l'intégralité du
  projet *contrôlé*.

- **Fichiers suivis** : fichiers du *répertoire* dont le VCS trace
  l'historique. D'autres fichiers peuvent éventuellement être
  **non-suivis** par le VCS.

- **Historique** : la suite des modifications qui amène de l'état
  initial du répertoire à l'état courant.

- **Commit** (révision) : modification *incrémentale* de l'état du
  répertoire, portant un **numéro de révision**.

- **Snapshot** (instantanée) : copie de l'intégralité du répertoire à
  un instant donné.

- **Tag** (étiquette) : un nom faisant référence à un snapshot
  particulier (par ex.: la version 1.2.3 du projet).

</section>
<section>

## Concepts clefs

- VCS **centralisé** (CVS, SVN) : un unique *serveur* garde
  l'intégralité de l'historique et ordonne les commits. Les clients
  gardent uniquement un snapshot.

- VCS **distribué** (Git) : tous les clients gardent l'intégralité de
  l'historique. Il n'existe pas de serveur privilégié.

- **Conflit** : deux *commits* qui modifient l'état du répertoire de
  façon incompatible.

- **Merge** (fusion, résolution de conflits) : un nouveau commit qui
  décide comment *unifier* deux commits en conflit.

- **Branche, fork** : historique qui diverge de l'historique original
  à partir d'un certain commit. Deux branches peuvent être réunifiées
  par un *merge*.

- ...

</section>
<section>

## Concepts clef de Git

Git définit trois *zones* qui représentent le répertoire

- La *working directory* : le dossier, avec son contenu suivi et
  non-suivi.

- Le *project tree* : le répertoire tel qu'il est décrit dans
  l'historique.

- La *staging area* : une zone pour préparer les modifications à
  *commiter*.

</section>
<section>

## Les commits

Un commit est une **différence** entre l'état précédent et l'état
actuel du répertoire.

Un commit est défini par

- Son *parent* : le commit qui le précède (à l'exception du commit
  initial).

- Son *contenu* : les modifications apportées.

- Son *message* : une description de ce qu'il fait.

Un commit peut avoir *plusieurs parents*, dans ce cas il est appelé un
**merge**.

### Le SHA

Chaque commit est identifié par son SHA. Un code de 20
octets qui lui est *unique* (ou presque).

</section>
<section>

## L'historique

L'**historique** est une *suite de commits*.

- L'historique le plus simple est un empilement *linéaire* de commits.

- Plus généralement, un historique est un DAG (Directed Acyclic Graph)
  de commits (pour la semaine prochaine).

### Les branches

- Une **branche** est une étiquette qui pointe vers un commit.

- La branche par défaut s'appelle `master`.

- Le répertoire a toujours une *branche courante*. Lorsqu'on produit
  un nouveau commit, la branche courante est mise à jour pour pointer
  vers celui-ci.

</section>
<section>

## Les *remotes*

Un répertoire peut garder des pointeurs vers des *copies distantes*
(**remotes**).

- Le répertoire n'est pas nécessairement synchronisé avec ses *remotes*.

- **Pousser** vers un *remote* lui envoie les modifications locales,
  pourvu qu'il n'y ait pas de conflits.

- **Tirer** d'un *remote* importe les modifications distantes. S'il y
  a des conflits, un *merge* est nécessaire.

Un *remote* peut être utilisé comme **répertoire central**, auquel
tous les développeurs se synchronisent.

</section>
<section>

## Les commandes principales

### Cette semaine

- Initialiser un répertoire : `git init`,
- Copier un répertoire distant : `git clone`,
- Préparer un commit (dans la *staging area*) : `git add`,
- Créer un commit : `git commit`,
- Examiner l'historique : `git log`, `git show`,
- Pousser, tirer : `git push`, `git pull`,

### La semaine prochaine

- Récupérer une version alternative d'un fichier : `git checkout`,
- Remonter le temps : `git reset`, `git revert`,
- Créer une branche : `git branch`,
- ...

</section>
<section>

## En savoir plus

- Le [livre officiel](http://git-scm.com/book/fr/v1),
- Une
  [explication interactive](http://onlywei.github.io/explain-git-with-d3/#reset)
  des principales commandes,
- Le [tutoriel interactif](https://try.github.io/) de GitHub
- Les [tutoriels de Atlassian](https://www.atlassian.com/git/tutorials/)

</section>
<section>

## Installer Git

**Créez-vous un compte [GitHub](https://github.com/) !**
{:.centered}

### Linux (déjà installé dans la VM)

Red Hat, Fedora, CentOS

~~~
yum install git
~~~

Ubuntu, Debian

~~~
apt-get install git
~~~

### Mac

Le client de GitHub : <https://mac.github.com/>.

### Windows

Le client de GitHub : <https://windows.github.com/>.

</section>
