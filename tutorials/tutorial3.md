---
layout: post
title: Le terminal et premiers pas avec Git
plugins: highlight
---

Si vous travaillez avec un cartable numérique, démarrez sous Linux.

Si vous travaillez avec votre ordinateur personnel, vous pouvez soit
travailler dans la machine virtuelle, soit dans votre système
d'exploitation. Dans un cas comme dans l'autre, nous allons installer
des nouveaux logiciels sur votre ordinateur, il vous faudra un minimum
de réseau et d'espace disque.

## Le terminal

Nous allons commencer par une prise en main du terminal de votre
système.

**Pour les Windows** : si ce n'est pas déjà fait, installez
l'émulateur de terminal PowerShell, que vous pouvez télécharger ici :

- [version pour Windows 8](http://www.microsoft.com/en-us/download/details.aspx?id=44987),
- [la version pour Windows Vista ou 7](https://www.microsoft.com/en-us/download/details.aspx?id=40855),
si je comprends bien,
- [la version pour Windows XP](http://www.microsoft.com/downloads/details.aspx?FamilyId=60cb5b6c-6532-45e0-ab0f-a94ae9ababf5),
- [autres versions](https://technet.microsoft.com/en-gb/scriptcenter/powershell.aspx).

Les utilisateurs Linux et Mac ont déjà un terminal installé, trouvez
le raccourci et lancez-le. La majorité des Ubuntu fournit aussi le
raccourci clavier `Ctrl-Alt-T`.

Dans les questions qui suivent, aidez-vous avec un explorateur
graphique de fichiers pour vous repérer dans l'arborescence.

1. Découvrez ce que font les commandes `pwd`, `ls` et `fkggfejedof`.

1. Des commandes avec paramètres, maintenant, tapez
   
   ~~~
   ls .
   ls *
   ls ..
   ls /
   ls Bureau
   ls sdfarfqwe234
   ~~~
   
   Expliquer quels fichiers sont affichés par chacune de ces
   commandes.

1. Utilisez les flèches haut et bas pour rappeler des anciennes
commandes.

1. Les bons émulateurs de terminal supportent
   l'*autocompletion*. Tapez `pw`, suivi de la touche *tab* une, deux,
   trois fois. Tapez
   
   ~~~
   ls Bur
   ~~~
   
   suivi de la touche *tab*, completez jusqu'à ce que le choix soit
   unique.

1. Les commandes `mkdir` et `rmdir` créent et détruisent un dossier
   vide. Testez-les.

1. Créez un dossier nommé `TD3`. Tapez les commandes (vous pouvez vous
   aider avec l'autocompletion)
   
   ~~~
   cd TD3
   pwd
   ls
   ls ../TD3
   ~~~

1. Lancez un éditeur de texte. Sous Windows, tapez la commande
   `notepad`. Sous Linux tapez le nom d'un éditeur de texte présent
   sur votre système, par exemple `gedit`. Sous Mac, tapez `TextEdit`.

1. Écrivez quelque ligne dans l'éditeur de texte, et sauvegardez sous
   le nom `test.txt`.

1. Revenez au terminal, tapez
   
   ~~~
   cat test.txt
   ~~~

1. Tapez
   
   ~~~
   less text.txt
   ~~~
   
   Utilisez la touche `q` pour sortir.

1. Tapez
   
   ~~~
   cd ..
   pwd
   ~~~

1. Essayez d'effacer le dossier `TD3`. Que se passe-t-til ?

1. Tapez
   
   ~~~
   rm TD3/*
   ls TD3
   ~~~

1. Effacez le dossier `TD3`.

Synthétisez ce que vous avez appris : que font les commandes `ls`,
`cd`, `pwd`, `rm`, `mkdir`, `rmdir`, `cat`, `less` ?


## Git

Nous pouvons maintenant passer à la découverte de Git. Pour cela, nous
devons commencer par l'installer. N'oubliez pas de créer votre
[compte GitHub](https://github.com/), si ce n'est pas déjà fait.

### Windows

Installer msysGit : <https://msysgit.github.io/>.

Dans un cas comme dans l'autre, lorsque l'installeur vous le propose,
choisissez les options :

- *Run Git from the Windows command prompt*,
- *Check out Windows style, commit Linux style line endings*.

L'installation inclut un émulateur de terminal appelé *Git Bash*,
similaire à PowerShell, mais avec un mode d'autocompletion plus adapté
à Git.

Alternativement, vous pouvez installer le client Git de GitHub,
téléchargeable ici : <http://windows.github.com> (uniquement pour
Windows 7 ou plus). msysGit sera installé avec.

Installez ensuite Node.js : <http://nodejs.org/download/>.


### Mac

Le plus simple c'est d'installer le client Git de GitHub,
téléchargeable ici : <http://mac.github.com>.

Alternativement, vous pouvez taper `git` dans le terminal, et l'OS
vous proposera d'installer Git s'il n'est pas déjà présent.

Installez ensuite Node.js : <http://nodejs.org/download/>.


### Linux et VM

Git est déjà installé sur les cartables numériques. Pour les autres
Linux, on installera la version contenue dans les paquets standards.

Sous Ubuntu, Debian et similaires, taper dans un terminal

~~~
sudo apt-get install git gitk
~~~

le mot de passe utilisateur des VM est *user*.

Installez ensuite Node.js avec la commande

~~~
sudo apt-get install nodejs nodejs-dev nodejs-legacy npm
~~~

### Découverte de Git

Dans ce TD nous allons utiliser Git à travers le terminal. Si vous
avez installé un client graphique, n'hésitez pas à découvrir comment
appliquer les mêmes commandes dans celui-ci. Sous Windows, PowerShell
ou Git Bash peuvent être utilisé indifféremment, mais le deuxième se
révélera plus pratique si vous avez pris l'habitude d'utiliser la
touche *tab* pour compléter.

1. Tapez les commandes
   
   ~~~
   git
   git help
   ~~~

1. Tapez
   
   ~~~
   git help init
   ~~~
   
   et lisez la documentation (touche `q` pour sortir). 

1. Créez un dossier, entrez dans le dossier (commande `cd`), puis
   initialisez-le pour Git avec `git init`.

1. Créez deux fichiers de texte nommés `a.txt` et `b.txt`.

1. Testez les commandes
   
   ~~~
   git status
   git add a.txt
   git status
   git commit -m "Premier commit"
   git status
   git log --stat
   ~~~

1. Créez un deuxième commit contenant le fichier `b.txt`. Lisez à
   nouveau la sortie de `git status` et de `git log`.

1. Tapez
   
   ~~~
   git rm a.txt
   ls
   git status
   ~~~
   
   puis commitez le changement. Lisez le log.



## Travailler avec une copie distante

Connectez-vous sur GitHub, puis visitez ce lien :
<https://github.com/defeo/in202.github.io/fork>. GitHub va prendre
quelques secondes pour vous en créer une copie personnelle.

Lisez le fichier de README, qui s'affiche dans le répertoire. Dans les
réglages (<https://github.com/moi/in202.github.io/settings>, où vous
aurez le soin de remplacer `moi` par votre nom d'utilisateur),
renommez le répertoire en `moi.github.io`, en remplaçant `moi` par
votre nom d'utilisateur.

Maintenant créez une copie locale du répertoire avec

~~~
git clone https://github.com/moi/moi.github.io.git
~~~

1. Dans l'interface web de GitHub, éditez le fichier `README.md`, et
   commitez les changements.

1. Tirez les changement dans votre copie locale du répertoire :
   
   ~~~
   cd moi.github.io
   git status
   git log
   git pull
   git status
   git log
   ~~~

1. Modifiez le fichier `README.md` sur votre ordinateur, commitez les
   changements, puis poussez vos changements sur GitHub :
   
   ~~~
   git status
   git push
   ~~~

1. Faites encore un changement à `README.md` dans l'interface de
   GitHub. Commitez. Ne tirez pas encore.

1. Faites un changement à `index.html` dans votre copie
   locale. Commitez. Essayer de pousser, que se passe-t-il ?

1. Tirez, puis lisez le log avec
   
   ~~~
   git log --graph
   ~~~
   {:.bash}
   
   Que s'est-il passé ? Poussez maintenant.

Vous pouvez analyser la situation de façon plus visuelle avec le
logiciel gitk, ou encore avec unGit. Installez unGit avec la commande

~~~
npm install -g ungit
~~~

ou, sous linux,

~~~
sudo npm install -g ungit
~~~

Puis, lancez le logiciel en tapant `ungit`. Le navigateur s'ouvrira
alors à l'adresse <http://localhost:8448/>, et une visualisation de
l'*arbre* de votre projet git apparaîtra.


## Ma page personnelle

Visitez l'URL <http://moi.github.io/> (remplacez `moi` par votre nom
d'utilisateur, comme d'habitude). Cette page web est la votre, vous
pouvez en disposer comme vous le souhaitez.

Reprenez le travail du [TD passé](../tutorial2), et faites-en votre
page web personnelle.

**Votre travail sera noté, vous avez jusqu'au jeudi 19 février à
minuit pour le compléter.**
