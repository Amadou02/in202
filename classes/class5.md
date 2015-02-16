---
layout: slideshow
title: Concepts de Git
subtitle: Diffs, commits, branches, remotes
---

<section>

## Le répertoire (*repository*)

Le dossier qui contient l'intégralité du projet

### Créer un répertoire de zéro

~~~
git init nouveau_projet
~~~

- Crée un dossier vide `nouveau_projet`, prêt pour le contrôle de
  versions.

### Copier un répertoire existant

~~~
git clone mon_projet ma_copie
git clone https://github.com/moi/mon_projet
~~~
{:.bash}

- Crée un dossier contenant une copie du projet.
- Garde une référence vers le projet d'origine (*remote* `origin`)
  pour les *push* et les *pull*.

</section>
<section class="compact">

## Sauvegardes incrémentales

Git représente l'historique par une *séquence de différences*
(*diffs*).  Une **différence** est décrite :

- <span style="color:lime">par les lignes ajoutées</span>,
- <span style="color:red">par les lignes enlevées</span>.

<pre class="no-highlight"><code><span style="font-weight: bold">diff --git a/js/polyfills.js b/js/polyfills.js
index 38f8652..9de8f99 100644
--- a/js/polyfills.js
+++ b/js/polyfills.js</span>
<span style="color: teal">@@ -81,13 +81,13 @@</span> Element.prototype.css = function(css) {
 }
 
<span style="color:red">-Element.prototype.on = function(evts, cb, bubble) {</span>
<span style="color:lime">+Window.prototype.on = function(evts, cb, bubble) {</span>
     var evts = evts.split(/\s+/);
     for (var i = 0 ; i < evts.length ; i++)
        this.addEventListener(evts[i], cb, bubble);
     return this;
}
</code></pre>

</section>
<section>

## Examiner une *diff*

- Montrer les différences par rapport à la dernière sauvegarde
  
  ~~~
  git diff
  ~~~

- Montrer les changements appliqués par un *commit*
  
  ~~~
  git show 7b4c982935c77fab568
  ~~~
  {:.bash}

- Explorateur graphique
  
  ~~~
  gitk
  ~~~

- Interface web (ex. : GitHub): <https://github.com/defeo/in202.github.io/commits/master>

</section>
<section class="compact">

## Le commit

Le *commit* est l'unité de sauvegarde de Git. Il est composé

- de la *diff* par rapport à la dernière sauvegarde,
- du message de commit, l'auteur, la date, etc.,
- des commits *parents*,
- du **commit hash** (20 octets), qui est son *identifiant unique*.

~~~
commit bf02e55732fd922e17a1cb20bf127e630261f069
Author: Luca De Feo <dfl@deagol>
Date:   Sat Feb 14 14:18:40 2015 +0100
 
    Amended TD 3 to cope with many platform problems
 
 TODO.md                |  1 +
 tutorials/tutorial3.md | 46 +++++++++++++---------------------------------
 2 files changed, 14 insertions(+), 33 deletions(-)

commit 3fb01d6b6d561cfa77f5f441353e90a6f842f4c1
~~~
{:.no-highlight}

</section>
<section>

## Créer un commit

### Par la ligne de commande

1. Ajouter les fichiers à sauvegarder (*staged files*)
   
   ~~~
   git add fichier1.c fichier2.html
   ~~~

2. Créer le commit (ouvre un éditeur pour écrire le message de commit)
   
   ~~~
   git commit
   ~~~
   {:.bash}
   
### Autres méthodes

- Interface graphique
  
  ~~~
  git gui
  ~~~

- Interface web (ex. : GitHub) : <https://github.com/defeo/in202.github.io/edit/master/README.md>

</section>
<section>

## Examiner les commits

- La liste de tous les commits
  
  ~~~
  git log
  ~~~
  
  options : `--stat` résumé des fichiers changés, `--graph` montre le
  DAG de l'historique.

- Examiner un seul commit
  
  ~~~
  git show c7f717e9b5a8fb34
  ~~~
  
  demande un *identifiant* du commit : partie initiale du *hash*, ou
  autre code (ex. : `HEAD` represente le dernier commit).

- Explorateur graphique : `gitk`.

- Explorateur web :  
  <https://github.com/defeo/in202.github.io/commits/master>.

</section>
<section class="compact">

## Examiner le répertoire

~~~
git status
~~~

<pre class=" no-highlight"><code>On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)
Changes to be committed:
  (use "git reset HEAD &lt;file>..." to unstage)
	<span style="color:green">new file:   classes/class5.md</span>
Changes not staged for commit:
  (use "git add &lt;file>..." to update what will be committed)
  (use "git checkout -- &lt;file>..." to discard changes in working directory)
	<span style="color:red">modified:   index.md</span>
Untracked files:
  (use "git add &lt;file>..." to include in what will be committed)
	<span style="color:red">classes/.#class5.md</span>
</code></pre>

</section>
<section>

## Les branches

Une *branche* est une *ligne de développement* :

- L'historique des commits qui amènent à la branche.
- En pratique, une branche est un *pointeur* à un commit.

Un répertoire peut contenir plusieurs branches. La branche par défaut
s'appelle `master`.

- Créer une branche :
  
  ~~~
  git branch nouvelle_branche
  ~~~

- Changer de *branche courante* (attention, il ne doit pas y avoir de
  modifications non commitées) :
  
  ~~~
  git checkout nouvelle_branche
  ~~~

</section>
<section>

## La branche courante

À tout moment le répertoire est *dans une branche*. Pour voir le nom
de la branche courante :

~~~
git branch -av
~~~

<pre><code><span style="color:lime">* master</span>                     3dbc6a4 Fixed bug
  test                       7b4c982 Wild experiment
<span style="color:red">  remotes/boilerplate/master</span> bf02e55 Version 2.0
</code></pre>

- Une branche indentifie un commit
  
  ~~~
  git log master
  ~~~
  {:.bash}
  
  ~~~
  commit 3dbc6a4bc0885c6af3f4f3ea8738781d31f971ac
  Author: Luca De Feo <dfl@deagol>
  Date:   Sun Feb 15 21:47:41 2015 +0100
  ~~~
  {:.no-highlight}

- La branche courante **évolue** : `git commit` ajoute le nouveau
  commit à la branche courante.


</section>
<section>

## Travailler avec des *remotes*

Les *remotes* sont des copies distantes du répertoire (par ex.,
GitHub).

- Un répertoire cloné a toujours un *remote* appelé `origin`.
  
  ~~~
  git remote -v
  ~~~
  
  ~~~
  origin	git@github.com:/defeo/in202.github.io (fetch)
  origin	git@github.com:/defeo/in202.github.io (push)
  ~~~
  {:.no-highlight}

- On peut ajouter et enlever des *remotes*
  
  ~~~
  git remote add jean https://github.com/jean/son_projet.git
  git remote remove mon_collegue
  ~~~
  {:.compact.no-highlight}

</section>
<section>

## Branches tracées

Dans un répertoire cloné, les *branches locales **tracent** les
branches distantes*.

~~~
git branch -vv
~~~

<pre class="no-highlight"><code>  test   7b4c982 [<span style="color:teal">jean/test</span>] Wild experiment
<span style="color:lime">* master</span> 3dbc6a4 [<span style="color:teal">origin/master</span>] Version 1.1
</code></pre>

- `test` trace `jean/test`,
- `master` trace `origin/master`.


### Télécharger les changements

~~~
git fetch jean
~~~

Télécharge les modifications dans le remote `jean`, sans faire des
modifications à la branche locale.  `git status` montre les
différences entre la **branche courante** et sa **branche tracée**.

</section>
<section>

## Pousser, tirer

- **Tirer :** appliquer les changements de la branche tracée.
  
  ~~~
  git pull --ff-only
  ~~~
  {:.bash}
  
  donne une **erreur si les historiques ont divergé**.

- **Pousser :** envoyer les changements à la branche tracée.
  
  ~~~
  git push
  ~~~
  {:.bash}
  
  donne une **erreur si les historiques ont divergé**. Requiert les
  **droits en écriture** sur le répertoire distant.

- **Tirer et *merger* :** appliquer les changements, même s'il y a des
  **confilts**
  
  ~~~
  git pull
  ~~~
  
  Si un conflit se présente `git merge --abort` revient à l'état avant
  le *pull*.

</section>
<section>

## Lectures

Le [Git Book](http://git-scm.com/book/fr/) :

- [1.3, Rudiments](http://git-scm.com/book/fr/v1/D%C3%A9marrage-rapide-Rudiments-de-Git),
- [2, Les bases](http://git-scm.com/book/fr/v1/Les-bases-de-Git),
- [3.1, Ce qu'est une branche](http://git-scm.com/book/fr/v1/Les-branches-avec-Git-Ce-qu-est-une-branche).

</section>

