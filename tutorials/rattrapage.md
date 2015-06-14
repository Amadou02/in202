---
layout: post
title: Examen de rattrapage
plugins: highlight
styles:
  - "../../assets/explain-git-with-d3/css/explaingit.css"
  - "../../assets/tutorial5-d3.css"
---

<script data-main="../../assets/explain-git-with-d3/js/main" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.4/require.js"></script>


## HTML et CSS

1. Considérez l'extrait HTML suivant
   
   ~~~
   <!Doctype html>
   <html>
     <head>
	   <meta charset="utf-8">
	   <link rel="stylesheet">
	     body { color: blue }
	   </link>
     </head>
	 <body>
	   <h1>Ma page personnelle</h1>
	 
	   <section class="lorem">
	     <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</li>
		 <li>sed do eiusmod tempor incididunt ut labore et dolore magna</li>
		 <li>aliqua. Ut enim ad minim veniam, quis nostrud exercitation</li>
		 <li>ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
	   </section>

	   <section class="lorem">
		 <p>Duis aute <strong><em>irure dolor in reprehenderit
		 in</strong> voluptate velit esse cillum dolore eu fugiat<br>
		 nulla pariatur. <link href="#lorem">Excepteur sint occaecat</link>
		 cupidatat non proident, sunt in culpa qui officia deserunt
		 mollit anim id est laborum.</p>
	   </section>

	   <img href="chat.svg">un chat</img>
     </body>
   ~~~
   
   Repérez toutes les erreurs dans le code et proposez une façon de
   les réparer.

2. Considérez le code HTML suivant
   
   ~~~
   <body>
	 <ul id="menu">
	   <li class="odd">One</li>
	   <li class="even">Two</li>
	   <li class="odd">Three</li>
	 </ul>
	 <div id="nav">
	   <div class="nav">
		 <h2>Nav 1</h2>
		 <h3 class="odd">Link 1</h3>
		 <h3 class="even">Link 2</h3>
		 <h3 class="odd">Link 3</h3>
	   </div>
	   <div class="nav">
		 <h2>Nav 2</h2>
	   </div>
	   <div class="nav">
		 <form id="login">
		   <input id="text" type="text" title="Insert text">
		   <input id="number" type="text" title="Insert number">
		   <input type="submit">
		 </form>
	   </div>
	 </div>
	 <div id="main">
	   <h1>Lorem Ipsum</h1>
	   <h2>dolor sit amet, consectetur adipisicing elit, sed do eiusmod
		 tempor incididunt ut labore et dolore magna aliqua.</h2>
	   <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco
		 laboris nisi ut aliquip ex ea commodo consequat.</p>
	   <p>Duis aute irure dolor in reprehenderit in voluptate velit
		 esse cillum dolore eu fugiat nulla pariatur.</p>
	 </div>
   </body>
   ~~~
   {:.allow-breaks}

   Indiquez à quels éléments correpondent les sélecteurs CSS suivants :

   * `div div`,
   * `h3, h2`,
   * `.odd li`,
   * `li.odd`,
   * `#nav`.
   
   Vous pouvez indiquer les balises par numéro de ligne, ou
   directement sur la feuille.

3. Considérez le code HTML suivant
   
   ~~~
   <div id="conteneur">
     <div class="fils" id="un">1</div>
     <div class="fils" id="deux">2</div>
     <div class="fils" id="trois">3</div>
   </div>
   ~~~
   
   accompagné par le code CSS suivant
   
   ~~~
   #conteneur {
     display: flex;
     flex-flow: row wrap;
	 width:  200px;
	 height: 100px;
	 border: solid thick black;
   }
   .fils {
     width: 100px;
	 height: 50px;
	 border: solid thick red;
   }
   #trois {
     order: -1;
   }
   ~~~
   {:.css}
   
   Dessinez l'affichage obtenu.


## Git

1. On vient d'exécuter la session suivante (dans un terminal Unix, ou
   dans PowerShell) :
   
   ~~~
   > ls
   achats.txt   fichier.doc   fichier2.txt
   dossier      fichier1.txt
   > rm fichier.*
   > mkdir dossier2
   ~~~
   {:.no-highlight}
   
   Si maintenant on tape la commande `ls *.txt`, quelle sera la sortie?

2. On considère un répertoire avec trois branches dans l'état suivant
   
   <div id="merge" class="git-d3"></div>
   <script>
   require(['historyview'], function(HistoryView) {
	   (new HistoryView({
		   height: 300,
		   baseLine: 0.8,
		   currentBranch: 'un',
		   commitData: [ {id: 'e137e9b'},
			   {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
			   {id: 'a606312', parent: 'e137e9b', tags: ['un']},
			   {id: '437bf34', parent: 'a606312', tags: ['deux']},]
		})).render(d3.select('#merge'));
	});
	</script>
	
	Dessiner l'état du répertoire après la commande `git merge master`
    (en supposant qu'il n'y ait pas de conflits).

3. Parmi les affirmations suivantes, indiquer lesquelles sont vraies
   et lesquelles sont fausses :
   
   - GitHub est un système de contrôle de versions.
   
   - La commande `git fetch` télécharge les modifications distantes du
	 projet.

   - La commande `git pull` télécharge les modifications distantes du
	 projet.

   - Un fichier modifié en parallèle par deux collaborateurs donne
	 nécessairement lieu à un conflit lors d'un `merge`.

   - La commande `git commit` envoie les modifications locales du
	 projet au serveur de contrôle de versions.
 
   - La commande `git pull` est l'équivalent de `git fetch` suivi de
     `git merge`.
	 
   - La commande `git rebase` est équivalente à `git pull --rebase`.
   
   - Deux commits différents ont nécessairement deux SHA différents.


## Python et outils

1. Que fait ce programme python ? Qu'affiche-t-il sur sa sortie ?
   
   ~~~
   def mystere(l):
	   a = l[0]
	   for x in range(len(l) - 1):
		   l[x] = l[x+1]
	   l[-1] = a
	   return l
   
   print mystere([1,2,3]) + mystere([4,5])
   ~~~
   {:.pyhton.force-page-break}

2. On considère les tableaux suivants
   
   <div class="two-cols">

   | | espèce | classe | vitesse max
   |---
   |0| mouette | oiseau | 100
   |1| lynx | mammifère | 60
   |2| zèbre | mammifère | 65
   |3| saumon | poisson | 45
   |4| moineau | oiseau | 70
   {:.pretty}
   
   | | espèce | pattes
   |---
   |0|mouette | 2
   |1|lynx    | 4
   |2|zèbre   | 4
   |3|moineau | 2
   {:.pretty}
   
   </div>

   On suppose que ces tableaux sont stockés dans des `DataFrame`
   pandas, respectivement de nom `animaux` et `pattes`.
   
   Donner la syntaxe pandas permettant d'obtenir le tableau suivant :
   
   | | espèce | classe | vitesse max | pattes
   |---
   |0| mouette | oiseau | 100  | 2
   |1| lynx  | mammifère | 60  | 4
   |2| moineau | oiseau | 70 | 2
   |3| zèbre | mammifère | 65 | 4
   {:.pretty}

   
3. On considère les mêmes tableaux. Dessiner le graphique produit par
   l'instruction
   
   ~~~
   animaux.groupby('classe').mean().plot()
   ~~~
   {:.python}


## Robotique

Expliquez, exemples de code à l'appui, la différence entre une
*fonction bloquante* et une fonction *non-bloquante*.  Expliquez avec
du pseudo-code comment on peut programmer un robot pour avancer
de 2 mètres

- lorsque l'on ne dispose que de fonctions bloquantes, et
- lorsque l'on dispose de fonctions non-bloquantes.
