---
layout: post
title: Mon site personnel et CSS avancé
plugins: highlight
---

Dans ce TD nous allons délaisser les outils *dans le cloud*, comme par
exemple [Thimble](https://thimble.webmaker.org), en faveur d'un
éditeur de texte traditionnel. Vous êtes libres d'utiliser votre
éditeur de texte préféré, du moment où il supporte la colorisation
syntaxique de HTML et CSS.

Le travail développé dans ce TD va vous être utile pour la suite du
cours. Si vous travaillez sur un cartable numérique, pensez à
sauvegarder une copie de votre travail dans un endroit où vous pourrez
accéder à nouveau (mail, dropbox, ...).


## Mon site personnel

Vous allez construire votre propre site web, composé de plusieurs
pages. Pour cette séance, le site ne sera sauvegardé que sur le disque
dur de votre ordinateur, et personne ne pourra y accéder depuis le
net. Dans les prochaines séances, nous allons changer cela.


1. Créez un nouveau dossier qui va contenir votre site.

1. Créez un fichier `index.html`, qui va être la page d'accueil de
   votre site. Préparez le fichier avec le squelette HTML habituel
   (voir [cours](../../classes/class1#un-document-html)).

1. Éditez le contenu de la balise `<title>`, et ajoutez un paragraphe
   de texte dans le `<body>`. Ouvrez le fichier dans un navigateur (un
   double clic devrait suffire) et observez le résultat ; vous pourrez
   afficher votre travail au fur et à mesure qu'il progresse en
   rechargeant la page.

1. Ajoutez une photo de vous dans le dossier. À l'aide de la balise
   `<img>`, insérez cette image dans la page.

1. Maintenant vous allez structurer votre page d'accueil. Créez et
   remplissez les sections suivantes :
   
   - Vos données personnelles (nom, prénom, numéro d'étudiant, photo, etc.)
   - La liste des cours que vous suivez, avec des liens vers les pages
	 web de ces cours si possible.
   - La liste de vos loisirs préférés.
   
   Chaque section va être délimitée par une balise `<section>`. Donnez
   des identifiants uniques à chaque section à l'aide de l'attribut
   `id`.
   
   Utilisez les balises `<h1>`, `<h2>`, `<p>`, `<ul>`, etc. pour
   structurer votre contenu. Ajoutez un pied de page (balise
   `<footer>`) avec une date et une mention de copyright. Ne vous
   occupez pas de la mise en page et du style pour l'instant.


## Ajouter du style

Maintenant que nous avons une page HTML basique, nous pouvons
commencer à travailler la mise en page. Nous allons utiliser une
feuille de style externe, pour des raisons qui deviendront claires
plus tard.

On rappelle qu'il existe trois types d'URLs qui permettent de faire
référence à un fichier extérieur :

- Les URLs complètes : `http://www.google.fr/search`, ou encore `file:///home/user/index.html`.
- Les URLs absolues : `/public/style.css`.
- Les URLs relatives : `style.css`, ou `./page.html`, ou encore `../../up.html`.

Les URLs relatives sont les plus appropriées pour indiquer le chemin
d'un fichier appartenant au même site. En effet, ces URLs vont
continuer à marcher même après avoir déplacé le dossier contenant le
site.

1. Créez un dossier `css`, et à son intérieur un fichier
   `style.css`. À l'aide de la balise `<link>`, attachez cette feuille
   de style à votre page HTML (voir [cours](../../classes/class2#html-et-css)).

1. En éditant uniquement le fichier `style.css`, ajoutez du style à
   votre page. Changez ses couleurs (fond et texte), sa largeur et ses
   marges. Encadrez les sections par des bordures, et arrondissez les
   coins à l'aide de la propriété `border-radius`. Séparez le pied de
   page par une ligne, et réduisez la taille de son texte.

1. Mettez en valeur la section contenant vos données et votre photo en
   lui donnant une couleur plus voyante, ou une taille de police plus
   importante. Utilisez l'attribut `id` donné auparavant pour faire
   référence à cette section. Utilisez la propriété CSS `float` sur
   l'image.


## Un site composé de plusieurs pages

Nous allons maintenant ajouter une deuxième page à notre site.

1. Créez un fichier `cv.html`, qui va contenir votre CV. Préparez le
   fichier avec le squelette HTML. Utilisez la balise `<link>` pour y
   associer la même feuille de style `style.css`.

1. Ajoutez du contenu à `cv.html` : vos données, vos études, vos
   expériences de travail, etc. Séparez les différentes sections avec
   des balises `<section>`. Vérifiez que le style s'applique bien de
   la même façon à cette page.

1. Ajoutez un menu de navigation aux pages `index.html` et
   `cv.html`. Le menu doit contenir un lien vers l'autre page, et un
   lien interne pour chaque section. Par exemple, le menu de `cv.html`
   pourrait ressembler à cela :
   
   - Accueil
   - CV
	   - Données personnelles
	   - Études
	   - Expériences professionnelles
	   - Loisirs

	Utilisez la balise `<a>` pour mettre un lien sur chaque élément du
    menu. Insérez vos menus dans une balise `<nav>`.

1. Changez le style du menu : réduisez la taille de la police, si vous
   avez utilisé une balise `<ul>`, faites disparaître les puces à
   gauche des liens.


## *Responsive layout*

Finalement, nous allons nous occuper de disposer correctement le menu
de navigation par rapport au reste de la page. Nous allons réaliser
plusieurs mises en page différentes qui s'adaptent à la taille de
l'écran. Pour cela, on utilise la syntaxe `@media`, comme dans
l'exemple suivant.

~~~
@media (max-width: 600px) {
	nav {
		background-color: red;
	}
}

nav {
	background-color: black;
}
~~~

1. Dans cet exemple, la couleur de fond des balises `<nav>` sera rouge
   si la taille de la fenêtre est plus petite que 600 pixels, et noire
   sinon. Essayez cette directive en re-dimensionnant la fenêtre de
   votre navigateur.

1. Pour les largeurs inférieures à `400px` :
   
   - Affichez le menu de navigation en haut de la page, sur une seule
	 ligne. Vous pouvez utiliser le box model classique, ou le
	 flexbox.
   
   - Affichez uniquement les liens « Accueil » et « CV », pas les
     liens internes (propriété `display: none`).

1. Pour les largeurs inférieures à `1024px`, affichez le menu de
   navigation à gauche de la page. L'utilisation de flexbox est
   conseillée pour cela, mais d'autres solutions sont possibles avec
   `position` et/ou `display`.

1. Pour les largeurs supérieures à `1024px`, affichez les différentes
   `<section>` de la page sur deux colonnes. Utilisez impérativement
   flexbox pour cela.


## CSS avancé

1. Enlevez le soulignage des liens des menus. Faites en sorte que
   quand la souris passe sur un lien, celui-ci devient souligné
   (pseudo-classe `:hover`).

1. Lorsque la fenêtre est de largeur inférieure `400px`, faites en
   sorte que le menu avec les liens internes ne s'affiche que lorsque
   l'on passe la souris sur le lien « Accueil » ou « CV ». Vous devez
   utiliser une combinaison de `:hover`, de `display` et de
   `position: relative` pour cela.

1. Colorez le fond des `<section>` alternativement en une couleur
   claire et une couleur sombre (pseudo-classe `:nth-child`).


## Une ébauche de solution

{% include codepen.md tab='html' pen='emegmW' %}
