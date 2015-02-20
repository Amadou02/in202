---
layout: post
title: Collaborer avec Git
plugins: highlight
---

<div>
<style scoped>
.A,.B,.L,.W { border-radius: 2px; padding-right: 2px; }
.A { box-shadow: -10px 0 2px 0 red }
.B { box-shadow: 10px 0 2px 0 blue }
.L { box-shadow: -10px 0 2px 0 yellow }
.W { box-shadow: 10px 0 2px 0 green }
</style>

Ce TD est à développer en binôme. Choisissez un collègue avec qui
travailler et installez-vous à côté. Vous allez travailler en
parallèle sur la construction d'un site web qui parle de Git. On va
vous appeler collègue **A**, et collègue **B**. Nous allons utiliser
des codes couleurs pour identifier les parties qui doivent être
développées par l'un et par l'autre.

Le travail attribué à **A** va être identifié par une bordure rouge à
gauche, comme dans ce paragraphe.
{:.A}

Le travail attribué à **B** va être identifié par une bordure bleue à
droite, comme dans ce paragraphe.
{:.B}

Le reste du texte concerne, bien sûr, les deux. Au sein d'une même
section, vous pouvez travailler en parallèle. Avant de passer à la
section suivante, attendez que votre collègue ait terminé.

## Configurer Git

Si vous ne l'avez pas déjà fait au dernier TD, il est temps de
configurer votre client Git avec votre nom et votre adresse email (il
ne doit pas nécessairement s'agir d'une adresse réelle). Ceci vous
évitera quelques avertissements pénibles de la part de Git.

Tapez les commandes

~~~
git config --global user.name "Votre nom"
git config --global user.email "vous@votre_ordinateur"
~~~


## Préparer un répertoire partagé

1. Créez un nouveau répertoire GitHub en vous rendant à l'adresse
   <https://github.com/new>. Nommez `TD4` le répertoire, renseignez
   une description en quelques mots, cochez la case **Initialize this
   repository with a README**, et cliquez sur **Create repository**.

1. Dans les réglages du projet, sélectionnez l'onglet
   **Collaborators** (url
   <http://github.com/moi/TD4/settings/collaboration>, remplacez *moi*
   par votre nom d'utilisateur). Renseignez l'identifiant GitHub de **B**
   dans la case, et cliquez sur **Add collaborator**. Votre mot de passe
   vous sera demandé. Maintenant vous avez tous les deux les droits en
   écriture sur le répertoire.
{:.A}

## Obtenir une copie locale du répertoire

1. Avec votre client Git, clonez le répertoire créé par **A** sur
   votre ordinateur. On utilisera la commande `clone`, comme au TD
   précédent.

1. Créez un fichier `index.html` dans le répertoire, rempli avec le
   squelette classique. Créez un *commit* contenant ce
   fichier. Vérifiez avec les commandes `log` et `status` que le
   fichier est bien *commité*. Poussez vos changements avec la
   commande `push`.
   {:.B}

1. Vérfiez dans l'interface GitHub que les modifications ont bien été
   reçues par le serveur.

## Recevoir les mises à jour

1. Avec la commande `pull --ff-only`, tirez les modifications
   apportées par votre collègue. Vérifiez que le fichier `index.html`
   est bien reçu.

1. Ouvrez et modifiez le fichier `index.html`. Obtenez une page qui
   ressemble à peu près à cela :
   
   <div class="centered">
   ### Le fantastique guide de Git
   
   par nom de **A**, nom de **B**
   </div>
   
   Faites une faute d'orthographe dans le nom de votre
   collègue. Ajoutez un peu de contenu.

1. Commitez et poussez.
{:.A}

1. Créez un nouveau fichier `commandes.html`. Avec les balises `<dl>`,
   `<dt>` et `<dd>`, rédigez une liste des commandes Git que vous avez
   connues jusqu'ici, avec une courte description.

1. **Ne commitez pas**. Vérifiez avec la commande `status` que vous
   avez bien des modifications en cours dans votre répertoire. La
   sortie de la commande `status` devrait normalement commencer par 
   
   ~~~
   On branch master
   Your branch is up-to-date with 'origin/master'.
   ~~~
   
   qui vous informe que votre copie locale est à jour (si vous
   utilisez un cartable numérique, la deuxième ligne risque de ne pas
   être affichée à cause de la version de Git ; ce n'est pas grave).

1. Utilisez la commande `fetch`, puis à nouveau la commande
   `status`. Si **A** a correctement poussé ses modifications, la
   commande `status` vous annoncera que votre copie locale n'est plus
   à jour, par le message
   
   ~~~
   On branch master
   Your branch is behind of 'origin/master' by 1 commit.
   ~~~
   
   Si le message vous dit que vous êtes encore *up-to-date*, attendez
   que votre collègue ait poussé, puis répétez l'opération.

1. Tirez les modifications de votre collègue avec `pull
   --ff-only`. Vérifiez avec les commandes `log` et `status` que vous
   avez bien reçu les modifications.
{:.B}

Si tout s'est bien passé, vous avez constaté que Git est arrivé à
tirer les modifications distantes, même si vous aviez des
modifications locales non encore commitées. En effet les modifications
concernaient deux fichiers différents, Git a donc pu les intégrer sans
difficultés.

Git ne détruit jamais les données : si vos modifications avaient porté
sur les mêmes fichiers, il aurait refusé de tirer.


## Même chose, rôles inversés

1. Commitez maintenant vos modifications à `commandes.html`. Vérifiez
   avec les commandes `status` et `log` que le commit a bien réussi.

1. Poussez les modifications avec la commande `push`.
{:.B}

1. Ajoutez une feuille de style à `index.html`. **Ne committez
   pas**.

1. Utilisez la commande `fetch`, puis à nouveau la commande
   `status`. Si **B** a correctement poussé ses modifications, la
   commande `status` vous annoncera que votre copie locale n'est plus
   à jour, par le message
   
   ~~~
   On branch master
   Your branch is behind of 'origin/master' by 1 commit.
   ~~~
   
   Si le message vous dit que vous êtes encore *up-to-date*, attendez
   que votre collègue ait poussé, puis répétez l'opération.

1. Tirez les modifications de votre collègue avec `pull
   --ff-only`. Vérifiez avec les commandes `log` et `status` que vous
   avez bien reçu les modifications.
{:.A}
 

## Éviter les conflits avec `stash`

1. Committez maintenant vos modifications à `index.html` et la feuille
   de style. Poussez.
{:.A}

1. **A** a mal orthographié votre nom dans
   `index.html`. Corrigez.

1. Tirez avec `pull --ff-only`. Si **A** a déjà poussé ses
   modifications, cette commande refusera de s'exécuter, car le
   fichier `index.html` vient d'être modifié. C'est la commande même
   qui vous suggère la solution : utiliser `stash`...

1. Vérifiez l'état du répertoire avec `status`. Utilisez la commande
   `stash`, puis vérifiez à nouveau avec `status`.

1. Vos modification ont disparu. Elles ne sont pas perdues, elles ont
   été mises dans une zone temporaire appelée *stash*. Vous pouvez
   analyser le stash avec la commande `stash show`.

1. Tirez maintenant avec `pull --ff-only`. Vérifiez avec `status` et
   `log`.

1. Récupérez vos modifications du *stash* avec la commande `stash
   apply`. Vérifiez avec `status`. Commitez. Poussez.
{:.B}

À partir de maintenant on va avoir besoin des commandes `git gui` et
`gitk`. Vous avez déjà installé ces commandes avec Git, mais elles ne
sont pas installées sur les cartables numériques. Pour régler le
problème, copiez-collez cette commande dans le terminal.

~~~
curl https://gist.githubusercontent.com/defeo/d79877d8548c390028df/raw/apt.sh | /bin/bash
~~~

Il vous sera demandé le mot de passe utilisateur (rappel: user).


## Faites la guerre

Ceci est un concours de vitesse : le premier qui termine a
gagné. Prêts ? C'est parti.

1. Tirez.

1. Examinez le dernier commit (commande `show`). **B** a corrigé son
   nom dans `index.html`. C'est inadmissible : il ne respecte pas
   votre autorité. Corrigez à nouveau en réintroduisant la faute
   d'orthographe.

1. On va utiliser l'interface graphique pour committer la
   modification. Tapez la commande `git gui`, l'interface graphique
   s'ouvre. L'équivalent de la commande `add` se trouve dans le menu
   *Commit*, et s'appelle *Stage to commit* (*Indexer*). L'équivalent
   de la commande `commit` se trouve dans le même menu. L'équivalent
   de la commande `push` se trouve dans le menu *Remote* (*Dépots
   distants*).

1. Committez. Poussez.
{:.A}

1. En réfléchissant, l'erreur dans votre nom devait être
   intentionnelle. Vengez-vous en introduisant une faute dans le nom
   de votre collègue.

1. On va utiliser l'interface graphique pour committer la
   modification. Tapez la commande `git gui`, l'interface graphique
   s'ouvre. L'équivalent de la commande `add` se trouve dans le menu
   *Commit*, et s'appelle *Stage to commit* (*Indexer*). L'équivalent
   de la commande `commit` se trouve dans le même menu. L'équivalent
   de la commande `push` se trouve dans le menu *Remote* (*Dépots
   distants*).

1. Committez. Poussez.
{:.B}

Le plus lent parmi les deux n'aura pas réussi à pousser. Le message
d'erreur, semblable à celui-ci

~~~
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
~~~

vous explique que vous ne pouvez pas pousser les modifications, car
votre historique local et l'historique distant ont divergé. Vous devez
préalablement résoudre le conflit de votre côté.

## Faites la paix

1. Faites un `fetch`.

1. Analysez la situation avec l'outil `gitk` (tapez uniquement `gitk`,
   pas `git gitk`, dans Mac/Linux ; tapez `gitk.cmd` dans
   Windows). Puisque `gitk` bloque le terminal, vous allez devoir
   ouvrir un deuxième terminal pour continuer à travailler
   (alternativement, sous Mac/Linux, vous pouvez taper `gitk &` pour
   garder le contrôle du terminal tout en lançant `gitk` dans le
   *background*).

Vous observez que les historiques ne sont pas les mêmes du côté de
**A** et du côté de **B**. Dans les deux cas, l'étiquette (la
*branche*) `master` indique l'état courant du répertoire local, alors
que `origin/master` indique l'état courant de répertoire distant.

Chez le gagnant, ces deux branches coïncident. Chez le perdant, ces
deux branches sont différentes, et l'historique est devenu
non-linéaire.

Vous allez résoudre cette situation en faisant la paix, et en
abandonnant votre petite guerre. Les instructions pour le perdant,
pour qui l'historique a divergé, sont en jaune (gauche). Les
instructions pour le gagnant sont en vert (droite).

1. Vous allez renoncer à votre commit. Pour ce faire, vous devez
   ramener la branche master à son état précédent. Avec `log`, ou dans
   `gitk`, repérez le SHA de l'avant-dernier commit (rappel : le SHA
   c'est cette longue chaîne de chiffres et de lettres qui identifie
   un commit). Ramenez votre branche `master` à ce vieux commit avec
   la commande
   
   ~~~
   git reset SHA
   ~~~
   {:.bash}
   
   où vous remplacerez `SHA` par une portion initiale du SHA du
   commit.

1. Analysez la situation avec `gitk` (touche `F5` pour actualiser),
   avec `log`, et avec `status`.

1. Maintenant éliminez définitivement votre modification à
   `index.html`, comme suggéré par la commande `status`, avec
   
   ~~~
   git checkout -- index.html
   ~~~
   {:.bash}

1. Finalement, vous pouvez tirer.
{:.L}


1. Vous ne pouvez pas renoncer à votre commit, car il a déjà été
   envoyé à GitHub. Le *mantra* de Git dit qu'il ne faut **jamais
   détruire un commit** (récrire l'histoire), une fois qu'il a été
   posté sur un répertoire public. Votre méfaite restera pour toujours
   dans l'historique du répertoire.
   
   Mais, au moins, vous pouvez modifier à nouveau le fichier pour
   réparer vos torts. La commande `revert` permet de défaire les
   modifications apportées par un commit, en ajoutant un nouveau
   commit qui réalise l'opération inverse. Elle prend en paramètre
   l'identifiant du commit à défaire, dans notre cas il s'agit du
   dernier commit, que nous pouvons sélectionner avec l'alias `HEAD`.
   
   ~~~
   git revert HEAD
   ~~~

1. Analysez la nouvelle situation avec les commandes `log`, `show` et
   avec `gitk`.

1. Poussez.
{:.W}

Tous les deux, tirez, et vérifiez que vos répertoires sont bien
synchronisés.


## Branches et `gh-pages`

Dans le TD passé, nous avons appris que le répertoire *magique*
`moi.github.io` crée un site web. Ceci est le seul répertoire magique
en GitHub, tous les autres étant des simples répertoires de code.

Mais GitHub offre aussi des *branches magiques*. Lorsque un répertoire
contient une branche `gh-pages`, le contenu de celle-ci est publié
comme une page web à l'adresse
<http://moi.github.io/nom-du-repertoire>.

1. Créez une branche `gh-pages` avec la commande
   
   ~~~
   git branch gh-pages
   ~~~
   
   Analysez la situation avec la commande `branch -avv` et dans
   `gitk`.

1. Modifiez le fichier de style. Committez. Analysez la situation avec
   `gitk` et `log`. Vous remarquez que votre *branche courante* est
   toujours `master`, et que c'est la seule à avoir avancé.

1. Poussez. Analysez la situation avec `branch -avv` et avec
   `gitk`. Allez dans l'interface web de GitHub et observez les
   branches connues par celui-ci (URL
   <https://github.com/moi/TD4/branches>).

1. Poussez la branche `gh-pages` avec la commande
   
   ~~~
   git push origin gh-pages
   ~~~
   
   Analysez à nouveau avec les mêmes méthodes utilisées précédemment.
{:.B}


Visitez l'URL <http://moi.github.io/TD4>, où `moi` est remplacé par le
nom d'utilisateur de **A** (le propriétaire du répertoire). La page
`index.html` doit être maintenant en ligne.


## Réconcilier deux branches par *fast-forward*

Dans `gitk`, on voit bien que les historiques de `gh-pages` et de
`master` n'ont pas divergé. Simplement, le deuxième est plus avancé
que le premier. Ces deux historiques peuvent être réconciliés par ce
que l'on appelle un *fast-forward merge*. C'est exactement le même
processus qui est appliqué (avec les branches distantes) lorsque vous
exécutez `push --ff-only`.

1. Faites un `fetch`. Analysez la situation avec `branch -avv` et dans
   `gitk`.

1. Téléchargez localement la branche `gh-pages` par la commande
   
   ~~~
   git checkout gh-pages
   ~~~
   
   Analysez à nouveau. Vous voyez que vous êtes maintenant sur la
   branche `gh-pages`, et non plus sur `master`. Les commandes `log`
   et `status` vous le confirmeront.
   
1. Importez les commits de la branche `master` avec la commande
   
   ~~~
   git merge master
   ~~~
   
   Analysez avec les commandes `log`, `status`, `branch -avv`, et avec
   `gitk`.

1. Poussez avec la commande
   
   ~~~
   git push
   ~~~
   
   Vous voyez dans la sortie de la commande, que cela a poussé la
   branche `gh-pages`. Vérifiez avec `gitk` et avec l'interface web de
   GitHub. Vérifiez que les modifications sont bien appliquées à
   <http://moi.github.io/TD4>.

1. Revenez à la branche `master` avec la commande `checkout master`.
{:.A}

Remarquez la légère différence dans la sortie de la commande `branch
-avv` entre **A** et **B**. La branche `gh-pages` de **A** *trace* la
branche `origin/gh-pages`, ce qui signifie que les pousser et les
tirer marcheront automatiquement. La branche `gh-pages` de **B** ne
*trace* aucune branche, ce qui oblige à donner des paramètres
supplémentaires lors des pousser/tirer. Nous verrons plus loin comment
changer cela.

## Éditer le même fichier, sans se marcher sur les pieds

Pas toutes les différences d'historique peuvent être résolues par un
*fast-forward*. Lorsque l'historique devient non-linéaire, ceci n'est
plus possible. Ici nous créons deux histoires divergentes qui peuvent
être réconciliées automatiquement par Git.

1. Éditez le `<head>` du fichier `index.html`. Assurez-vous que les
   balises `<title>` et `<meta>` sont présentes, que les feuilles de
   style sont bien linkés. Ajoutez une
   [favicon](http://fr.wikipedia.org/wiki/Favicon) (n'oubliez pas
   d'ajouter l'image au contrôle de versions). Ne touchez à rien
   d'autre.

1. Committez. Poussez.
{:.A}

1. Éditez le `<body>` de `index.html`. Ajoutez un menu de navigation
   avec un lien vers `commandes.html`. Ajoutez du style dans la
   feuille CSS. Ne touchez à rien d'autre.

1. Commitez.

1. Attendez que **A** ait poussé. Poussez. Cela ne marchera pas. Tirez
   avec `pull --ff-only`, cela ne marchera pas.

1. Faites un `fetch`. Analysez la situation dans `gitk`.

1. Analysez vos modifications avec
   
   ~~~
   git show master
   ~~~

1. Analysez les modifications distantes avec
   
   ~~~
   git show origin/master
   ~~~

1. Maintenant tirez avec un simple `pull`. Ceci est équivalent à faire
   
   ~~~
   git fetch
   git merge origin/master
   ~~~
   
   Si tout s'est bien passé, Git est arrivé à faire un *merge*
   automatique, en intégrant les modifications des deux côtés. Il
   ouvre alors un éditeur de texte pour saisir le nouveau message de
   commit pour le commit de *merge*. Saisissez le message et validez.

1. Analysez la situation avec `gitk`.

1. Analysez la situation dans le graphe de GitHub, à l'adresse
   <http://github.com/moi/TD4/network>.
{:.B}


## Gérer les conflits

Pas tous les conflits peuvent être gérés de façon automatique. Quand
deux co-auteurs modifient en même temps la même portion d'un fichier,
Git ne peut plus rien pour vous : vous devez résoudre les *conflits* à
la main.

Tirez tous les deux et assurez-vous que vos branches `master` sont
synchronisées.

1. Modifiez le fichier `commandes.html` en ajoutant la liste des
   dernières commandes que vous venez d'apprendre. Commitez. Poussez.
{:.B}

1. Modifiez le fichier `commandes.html` en ajoutant la liste et une
   courte description des dernières commandes que vous venez
   d'apprendre. Commitez.
   
1. Attendez que **B** ait poussé. Poussez. Tirez avec `pull
   --ff-only`.

1. Tirez avec `pull` et lisez le message d'erreur. Cela vous dit que
   vous avez des *conflits* à résoudre manuellement dans le fichier
   `commandes.html`.

1. Ouvrez le fichier `commandes.html`. Trouvez les conflits. Ils sont
   délimités par les caractères `<<<<<<`, `=======` et `>>>>>>`, qui
   marquent les portions locales et distantes en désaccord. Éditez le
   fichier jusqu'à résoudre tous les conflits. Cela signifie que vous
   devez faire des choix pour chaque conflit : quel texte garder, quel
   texte éliminer.

1. Analysez la situation avec `status`. Marquez le conflit comme étant
   résolu avec `add`. Commitez.

1. Analysez la situation avec `gitk`. Poussez.
{:.A}


## Travailler avec les *pull requests* de GitHub

Dans le monde du open-source, il n'est pas raisonnable de donner les
droits en écriture à tous les développeurs qui pourraient être amenés
à contribuer à un projet.

Même dans la gestion de projets internes, il est souvent préférable
qu'un groupe limité de *release manager* ait l'accès en écriture,
alors que la majorité des développeurs doit passer par une phase
d'approbation avant de voir ses modifications acceptées.

GitHub réalise son propre système de collaboration, centré autour des
*pull requests*. L'idée c'est de demander gentiment à l'auteur
original de tirer les contributions, plutôt que des les pousser sans
demander dans son répertoire.

1. Créez un *fork* du répertoire d'origine en cliquant sur le bouton
   *fork* dans l'interface web (URL <https://github.com/moi/TD4/fork>.

1. Ajoutez votre propre fork aux *remotes* de votre répertoire local
   avec la commande
   
   ~~~
   git remote add my_fork https://github.com/moiB/TD4.git
   ~~~

1. Faites *tracer* la branche `master` de votre nouveau fork par la branche
   `master` locale, avec cette commande
   
   ~~~
   git branch --set-upstream-to=my_fork/master
   ~~~
   
   À partir de maintenant, les pousser et les tirer iront par défaut
   vers votre propre fork.

1. Faites la même chose pour la branche `gh-pages`. Mettez-vous
   d'abord sur cette branche avec la commande `checkout`, puis
   utilisez la même commande qu'au point précédent.

1. Analysez la situation avec `branch -avv` et dans `gitk`.

1. Faites des modifications aux styles des deux pages html. Commitez.

1. Poussez. Vérifiez que tout s'est bien passé avec `status`, `log`,
   et `gitk`.

1. Visitez la page web de votre fork et créez une *pull request* (URL
   https://github.com/moiB/TD4/compare/). Donnez un message expliquant
   pourquoi vous voulez que vos modifications soient reçues.
{:.B}


1. Attendez de recevoir la *pull request* de **A**. Vous allez
   recevoir un mail automatique à ce moment là.

1. Analysez la *pull request* dans l'interface GitHub. Normalement,
   elle doit pouvoir être incluse avec un *fast-forward*, par
   conséquent il suffira de cliquer sur le bouton "merge pull request".

1. Tirez et analysez la situation avec `gitk`.
{:.A}


## Au travail

Maintenant que vous avez tous les outils de base pour travailler de
façon collaborative, attaquez vous au contenu de votre site.

- Complétez la description des commandes Git et de leurs paramètres
  dans `commandes.html`.
  
- Dans `index.html` rédigez une description théorique de Git : ce que
  c'est qu'un commit, une branche, etc.

- Peaufinez le style.

Commitez et poussez/tirez souvent, ceci à fin de ne jamais être trop
désynchronisés. Résolvez les conflits lorsque nécessaire. Publiez
votre travail sur les deux adresses <http://moiA.github.io/TD4> et
<http://moiB.github.io/TD4> en mettant à jour la branche `gh-pages`.

</div>
