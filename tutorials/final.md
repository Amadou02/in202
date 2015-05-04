---
layout: post
title: Contrôle continu de récapitulation
plugins: highlight
styles:
  - "../../assets/explain-git-with-d3/css/explaingit.css"
  - "../../assets/tutorial5-d3.css"
---

<script data-main="../../assets/explain-git-with-d3/js/main" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.4/require.js"></script>


## HTML et CSS

1. Considérez l'extrait HTML suivant
   
   ~~~
   <html>
     <head>
	   <meta charset="utf-8">
       <h1>Bienvenue sur ma page !</h1>
	   <style type="stylesheet" href="style.css"></style>
     </head>
	 <body>
	   <title>Ma page personnelle</title>
	 
	   <section id="lorem" class="lorem">
	     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
		 sed do eiusmod tempor incididunt ut labore et dolore magna
		 aliqua. Ut enim ad minim veniam, quis nostrud exercitation
		 ullamco laboris nisi ut aliquip ex ea commodo consequat.
	   </section>

	   <section id="lorem" class="lorem">
		 Duis aute <strong><em>irure dolor in reprehenderit
		 in</strong></em> voluptate velit esse cillum dolore eu fugiat
		 nulla pariatur. <a href="#lorem">Excepteur sint occaecat</a>
		 cupidatat non proident, sunt in culpa qui officia deserunt
		 mollit anim id est laborum.</p>
	   </section>

	   <img src="chat.svg">un chat</img>
     </body>
   </html>
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

   Indiquez à quels éléments correpondent les sélecteurs CSS suivants :

   * `h1 h2`,
   * `h2, h3`,
   * `.menu li`,
   * `li.menu`,
   * `#main`.
   
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
     flex-flow: column nowrap;
	 width:  200px;
	 height: 100px;
	 border: solid thick black;
   }
   .fils {
     flex: 1 1 auto;
     width: 100px;
	 height: 10px;
	 border: solid thick red;
   }
   #trois {
     flex: 2 1 auto;
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
   
   Si maintenant on tape la commande `ls *`, quelle sera la sortie?

2. On considère un répertoire avec trois branches dans l'état suivant
   
   <div id="merge" class="git-d3"></div>
   <script>
   require(['historyview'], function(HistoryView) {
	   (new HistoryView({
		   height: 300,
		   baseLine: 0.7,
		   commitData: [ {id: 'e137e9b'},
			   {id: 'a330b10', parent: 'e137e9b', tags: ['master']},
			   {id: 'a606312', parent: 'e137e9b', tags: ['un']},
			   {id: '437bf34', parent: 'a606312', tags: ['deux']},]
		})).render(d3.select('#merge'));
	});
	</script>
	
	Dessiner l'état du répertoire après la commande `git merge un` (en
    supposant qu'il n'y ait pas de conflits).

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
   def lucas(n):
	   a = [2, 1]
	   for x in range(n - 1):
		   tmp = a[-1] + a[-2]
		   print tmp
		   a.append(tmp)
	   return a[n]
   
   print lucas(4) + lucas(5)
   ~~~
   {:.pyhton}

2. On considère les tableaux suivants
   
   <div class="two-cols">

   | | fruit | couleur | poids (g)
   |---
   |0| pomme | rouge | 50
   |1| fraise| rouge | 8
   |2| pomme | jaune | 20
   |3| poire | verte | 40
   |4| mangue| jaune | 100
   {:.pretty}
   
   | | fruit | vitamine
   |---
   |0|carotte| D
   |1| pomme | C
   |2| mangue| K
   {:.pretty}
   
   </div>

   On suppose que ces tableaux sont stockés dans des `DataFrame`
   pandas, respectivement de nom `fruits` et `vitamines`.
   
   Donner la syntaxe pandas permettant d'obtenir le tableau suivant :
   
   | | fruit | couleur | poids (g) | vitamine
   |---
   |0| pomme | rouge | 50  | C
   |2| pomme | jaune | 20  | C
   |4| mangue| jaune | 100 | K
   {:.pretty}

   
3. On considère les mêmes tableaux. Dessiner le graphique produit par
   l'instruction
   
   ~~~
   fruits.groupby('couleur').sum().plot(kind='bars')
   ~~~
   {:.python}


## Robotique

Expliquez, exemples de code à l'appui, la différence entre une
*fonction bloquante* et une fonction *non-bloquante*.  Expliquez avec
du pseudo-code comment on peut programmer un robot pour avancer
jusqu'à ce qu'il rencontre un obstacle

- lorsque l'on ne dispose que de fonctions bloquantes, et
- lorsque l'on dispose de fonctions non-bloquantes.
