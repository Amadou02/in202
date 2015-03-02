---
layout: slideshow
title: Gestion de conflits
subtitle: Branches, merges, récrire l'histoire
styles: "../../assets/explain-git-with-d3/css/explaingit.css"
---

<script data-main="../../assets/explain-git-with-d3/js/main"
	src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.4/require.js"></script>

<section>

## Désynchronisation

Les branches, locales ou distantes, se désynchronisent
nécessairement :

- modifications locales,
- modifications distantes par un collaborateur,
- branches expérimentales,
- retour dans le passé...

Commandes fondamentales :

- `fetch` : télécharge toutes les modifications distantes, sans
  toucher à l'historique local.

- `status` : montre l'état de synchronisation.

- `merge` : importe les commits d'une autre branche.

- `pull` : équivalent de `fetch`, puis `merge` (avec branche tracée).

</section>
<section>

## Modifications locales

Le répertoire a changé localement, l'origine n'a pas bougé.

	git status

~~~
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
(use "git push" to publish your local commits)
~~~
{:.bash}

L'origine peut être mise à jour par un *fast-forward*.

	git push
{:.bash}

</section>
<section>
<style scoped>.svg-container { margin-left: 250px !important }</style>

<div id="ExplainGitPush-Container">
<div class="playground-container"></div>
</div>

</section>
<section>


## Modifications distantes

L'origine a changé, le répertoire local n'a pas bougé

	git status

~~~
On branch master
Your branch is behind 'origin/master' by 2 commits,
and can be fast-forwarded.
  (use "git pull" to update your local branch)
~~~
{:.bash}

Le répertoire locale peut être mis à jour par un fast forward.

	git pull

</section>
<section>
<style scoped>.svg-container { margin-left: 250px !important }</style>

<div id="ExplainGitPull-Container">
<div class="playground-container"></div>
</div>

</section>
<section>

## Historique divergent

Les deux branches ont subi des modifications concurrentes.

	git status

~~~
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 2 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
~~~

Le *fast-forward* est impossible. Il est nécessaire de faire un
*merge*.

Télécharger et faire un *merge*

	git pull

Annuler si le *merge* n'est pas un *fast-forward*

	git pull --ff-only
{:.bash}

</section>
<section>
<style scoped>.svg-container { margin-left: 250px !important }</style>

<div id="ExplainGitMerge-Container">
<div class="playground-container"></div>
</div>

</section>
<section class="compact">

## Les conflits, ça arrive

	git pull

~~~
Auto-merging tutorials/tutorial4.md
CONFLICT (content): Merge conflict in tutorials/tutorial4.md
Automatic merge failed; fix conflicts and then commit the result.
~~~
{:.no-highlight}

	git status

~~~
On branch master
Your branch and 'origin/master' have diverged,
and have 1 and 2 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:   tutorials/tutorial4.md

no changes added to commit (use "git add" and/or "git commit -a")
~~~
{:.bash}

</section>
<section>
<style>
.diff { color: blue; }
html[data-incremental="1"] .local,
html[data-incremental="2"] .remote,
html[data-incremental="3"] .context {
  outline: solid thick red;
}
</style>

## Anatomie d'un conflit

<pre><code><span class="context">Lorem ispsum</span>
<span class="diff"><<<<<<< HEAD</span>
<span class="local">dolor sit amet</span>
<span class="diff">=======</span>
<span class="remote">dolor sit amemus</span>
<span class="diff">>>>>>>> a10ce40a3d3aedd7b4517249df5615b08087a044</span>
<span class="context">quousque tandem</span>
</code></pre>

- Modifications locales (`HEAD`),
- Modifications distantes,
- Contexte.
{:.incremental}

<div class="incremental">

- L'utilisateur qui réalise le *merge* doit choisir une résolution
  pour le conflit.
- Une fois le conflit résolu : `add`, puis `commit`.
- Outils pour l'aide à la résolution de conflits : KDiff3, DiffMerge,
  Meld, ...

</div>

</section>
<section>

## Récrire l'histoire

**Important :** On ne récrit **jamais** l'historique d'un répertoire
partagé : `origin` n'oublie pas !

Cependant, on est libres de faire ce que l'on veut avec ses branches
locales :

- `commit --amend` : récrit les métadonnées d'un commit.
- `revert` : crée un commit qui défait un commit précédent.
- `reset` : revient à un ancien commit.
- `reset --hard` : revient à un ancien commit, et modifie les
  fichiers.
- `rebase` : rejoue une suite de commits à partir d'un autre point de
  l'histoire.
- `cherry-pick` : rejoue un commit à partir de `HEAD`.

`show` et `checkout` permettent aussi d'examiner les fichiers tels
qu'ils étaient à un moment dans l'historique.

</section>
<section>

## Oublier des commits : `reset`

- Revenir à un moment de l'histoire, les fichiers ne sont pas touchés
  
	  git reset SHA
  {:.bash}
  
  `checkout` permet de reporter des fichiers individuels à l'état du
  commit.

- Revenir à un moment de l'histoire, les fichiers sont reportés à
  l'état du commit
  
	  git reset --hard SHA
  {:.bash}
  
  **Attention :** ceci détruit tous les changements non commités.

</section>
<section>
<style scoped>.svg-container { margin-left: 250px !important }</style>

<div id="ExplainGitReset-Container">
<div class="playground-container"></div>
</div>

</section>
<section>

## Rejouer des commits : `rebase`

- Rejouer les commits à partir du dernier commit commun
  
	  git rebase <branch>
  {:.bash}

- Faire un *fetch* et rejouer les commits d'un seul coup
  
	  git pull --rebase
  {:.bash}
  
  Alternative au *merge* classique. Adapté pour des petites
  modifications à pousser immédiatement.

</section>
<section>
<style scoped>.svg-container { margin-left: 250px !important }</style>

<div id="ExplainGitRebase-Container">
<div class="playground-container"></div>
</div>

</section>
<section>

## Récrire l'histoire distante

Récrire l'histoire de `origin`, c'est mal. Mais...

- Remplacer l'historique distant avec l'historique local
  
	  git push -f
  {:.bash}

- Effacer une branche distante
  
	  git push origin :<branche>
  {:.bash}

À n'utiliser que si vous savez vraiment ce que vous faites !

</section>
<section>

## Lectures

Le [Git Book](http://git-scm.com/book/fr/) :

- [3, Les branches avec Git](http://git-scm.com/book/fr/v1/Les-branches-avec-Git).
- [6, Utilitaires Git](http://git-scm.com/book/fr/v1/Utilitaires-Git).

Et, lorsque vous êtes perdus,

	git help <command>
{:.bash}

très verbeux, mais très complet.

</section>

<script type="text/javascript">
require(['explaingit'], function (explainGit) {
  explainGit.open({
    name: 'Push',
    height: 500,
    baseLine: 0.6,
    commitData: [
	  {id: 'e137e9b', tags: ['origin/master']},
	  {id: '32320ed', parent: 'e137e9b'},
	  {id: 'a9120c2', parent: '32320ed', tags: ['master']},
	],
    originData: [
	  {id: 'e137e9b', tags: ['master']},
	],
    initialMessage: 'Utilser push pour mettre à jour le remote.'
  });

  explainGit.open({
    name: 'Pull',
    height: 500,
    baseLine: 0.6,
    originData: [
	  {id: 'e137e9b'},
	  {id: '32320ed', parent: 'e137e9b'},
	  {id: 'a9120c2', parent: '32320ed', tags: ['master']},
	],
    commitData: [
	  {id: 'e137e9b', tags: ['master', 'origin/master']},
	],
    initialMessage: 'Faire un fetch, puis un pull.'
  });

  explainGit.open({
    name: 'Merge',
    height: 500,
    baseLine: 0.8,
    originData: [
	  {id: 'e137e9b'},
	  {id: '32320ed', parent: 'e137e9b'},
	  {id: 'a9120c2', parent: '32320ed', tags: ['master']},
	],
    commitData: [
	  {id: 'e137e9b', tags: ['origin/master']},
	  {id: '93128ab', parent: 'e137e9b', tags: ['master']},
	],
    initialMessage: 'Faire un fetch, puis un pull.'
  });

  explainGit.open({
    name: 'Reset',
    height: 500,
    baseLine: 0.6,
    commitData: [
	  {id: 'e137e9b'},
	  {id: '93128ab', parent: 'e137e9b', tags: ['master']},
	  {id: 'af90193', parent: 'e137e9b'},
	  {id: '7d394ac', parent: 'af90193', tags: ['topic']},
	],
    initialMessage: 'Essayez reset'
  });

  explainGit.open({
    name: 'Rebase',
    height: 550,
    baseLine: 0.7,
    commitData: [
	  {id: 'e137e9b', tags: ['origin/master']},
	  {id: '93128ab', parent: 'e137e9b', tags: ['master']},
	  {id: 'af90193', parent: 'e137e9b'},
	  {id: '7d394ac', parent: 'af90193', tags: ['topic']},
	],
    originData: [
	  {id: 'e137e9b'},
	  {id: '32320ed', parent: 'e137e9b'},
	  {id: 'a9120c2', parent: '32320ed', tags: ['master']},
	],
    initialMessage: 'Essayez rebase'
  });

  $$('.playground-container').forEach(function(x) {
	x.on('keydown', function(e) { e.stopPropagation() });
  });
});
</script>
