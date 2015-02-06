---
layout: slideshow
title: Structuration de contenus
subtitle: Langages de balisage, HTML
---

<section>

# Applications de l'informatique

</section>
<section>

## *L'informatique*, qu'est-ce ?

- **Informati**que : science de l'**information**
- *Computer science* en anglais : science des **calculateurs**
- *Information technology (IT)* : **technologie** de l'**information**

### Information

- Concept abstrait : objet *mathématique* (**théorie de l'information**).

- Entité physique : au même titre que la *matière* et l'*énergie*.

</section>
<section>

### Calcul

- Concept abstrait : **algorithmes**, **structures de données**
  (*combinatoire*), **langages**, **compilation** (*logique*).
  
- Problème concret : **machines à calculer** (*éléctronique*,
  *phyisque*)

### Technologie

- Comment organiser une machine à calculer : **architecture des ordinateurs**,
  **génie logiciel**, ...

- Comment échanger de l'information : **réseaux**, **codage**,
  **traitement du signal**, **cryptographie**, ...

- Comment préserver et traiter l'information : **bases de données**,
  **web sémantique**, **big data**, ...

- Et encore : **calcul hautes performances**, **interfaces
  homme-machine**, **intelligence artificielle**, **théorie du
  contrôle**, ...

</section>
<section>

## Applications de l'informatique

### Dans la vie de tous les jours

- Bureautique, communication, divertissement, objets connectés.

### Dans les sciences expérimentales

- Simulation,
- Traitement et visualisation de données,
- Documents et bases de données scientifiques.

### Ce cours

- Structuration et présentation de données : HTML, web statique.
- Gestion de documents : contrôle de versions.
- Visualisation de données : *notebooks* scientifiques.
- Traitement de données.

</section>
<section>

# Langages de balisage

</section>
<section>

## Langage de balisage

Langage de *structuration* de données (en général textuelles).

En anglais : **markup language**.

### Applications

- Associer une **sémantique** aux éléments d'un document,

- Associer des **méta-données**,

- Donner un **rôle**.

### Exemples

- LaTeX : écriture de documents scientifiques,

- HTML : contenu des pages web,

- XML : langage générique de structuration de données.

</section>
<section>

## Balises

Les *balises* sont les éléments du langage qui permettent de *marquer*
le *contenu*.

**Exemple à la HTML/XML**

~~~
<paragraphe>
  Ceci est le contenu de mon document,
  <important>ce document ne contient
  que des informations importantes !</important>
</paragraphe>
~~~

</section>
<section>

## Balises HTML

En XML et ses langages dérivés (par ex. HTML), une **balise** (en
anglais **tag**) s'écrit toujours entre chevrons `< >`.

**Balise ouvrante :** `<balise>`

**Balise fermante :** `</balise>`

À chaque balise **ouvrante** correspond (presque) toujours une balise
**fermante**. **Les balises doivent être fermées dans l'ordre inverse
de leur ouverture**, comme les parenthèses !

~~~
<contenu>
  Lorem ipsum <bleu>bla</bleu>,
  <gras><bleu>sit amet</bleu></gras>.
</contenu>
~~~

</section>
<section>

## HTML

HTML est un *langage de balisage*, pour l'écriture de documents
Hypertexte **lisibles par un human** (!!!)

### Document hypertexte

- Document de **texte** : texte, phrases, paragraphes, titres, ...

- **Hyperliens** : sauter d'un document à un autre,

- **Multimedia** : images, vidéos, éléments interactifs, ...

### Balises

- Structuration du texte : style, corps du texte, titres, ...

- Multimedia : tableaux, images, vidéos, ...

- Structuration du document : méta-données, ressources externes, ...

</section>
<section>

## Un document HTML

~~~
<html>
	<head>
		<title>Le titre du document</title>
		<meta charset="utf-8" />
		...
	</head>
	<body>
	  <!-- Ceci est un commentaire -->
	  ...
	</body>
</html>
~~~

- Le **head** contient les méta-données du document : encodage,
  documents annexes, ...

- Le **body**, contient le **contenu** du document : texte et
  multi-media.

</section>
<section>

## Commentaires

Les commentaires sont écris entre `<!--` et `-->`

~~~
<!-- Ceci est un commentaire, ce sera ignoré -->
<tag>Ceci sera interprété par le browser</tag>
~~~

Bien évidemment, un commentaire **n'est pas une balise**, elle lui
ressemble juste un tout petit peu.

</section>
<section>

## Structuration du document et méta-données

Quelques balises qui vont dans le **head** :

`<title>`: Le titre du document. **Obligatoire.**

`<script>`: Code pour le scripting côté client (JavaScript, VBScript, etc.).

`<style`>: Directives d'affichage (CSS, etc.).

`<meta>`: Méta-informations sur le document (langue, encodage, etc.).

`<link>`: Documents reliés (flux de news, favicons, etc.)

`<base>`: Base pour la résolution des liens.

</section>
<section>

## Structuration du texte

Ces balises vont dans le **body** et permettent d'en structurer le
contenu.

`<section>`, `<nav>`: Structure du document.

`<header>`, `<footer>`, `<aside>`, `<address>`: Structure d'une section.

`<p>`, `<h1>`, ..., `<h6>`: Un paragraphe de texte, un titre de
premier niveau, ..., un titre de sixième niveau.

`<a>`: Une *ancre*, c.-à-d. un lien hypertexte vers d'autres contenus.

`<strong>`, `<em>`: Texte présente *différemment* (par ex., gras ou italique)

</section>
<section>

## Multimedia

Ces balises aussi vont dans le **body**

`<img>`, `<audio>`, `<video>`, `<object>`, `<svg>`: Inclusion de medias.

`<form>`, `<input>`, ...: Interaction avec l'utilisateur.

`<table>`, `<tr>`, `<td>`, ...: Tableaux.

</section>
<section>

## Attributs

Les balises peuvent avoir des **attributs**, dans la balise ouvrante.

~~~
<tag attribut1="valeur 1"
     attribut2='valeur 2'
     attribut3=valeur3>
  Contenu
</tag>
~~~

- Les valeurs des attributs sont contenues entre guillemets simples,
  doubles ou aucun guillemet ; dans ce dernier cas (à éviter)
  elles ne doivent pas contenir d'espace.
- Certains attributs sont obligatoires pour certains tags.

</section>
<section>

## Attributs

Les attributs jouent plusieurs rôles. Voici les plus communs.

`id`: Assigne un identifiant à une balise. Doit être unique.

`class`: Assigne une balise à une **classe** (pour regroupement logique).

`src`: Indique où trouver les ressources externes.

`href`: HyperReference. Utilisé pour faire des liens aux ressources externes.

`style`: Pour ajouter des directives de style.

`title`: Donne plus d'informations sur une balise.

`onclick`, `onload`, `onmouseover`, ...: *Event hooks* pour les scripts.

`data-*`: Attributs définissables par les utilisateurs (depuis HTML5).

</section>
<section>

## Exemples

Un titre, un paragraphe et un peu de
style. [Démo](http://jsfiddle.net/defeo/mfjoh4mq/).

~~~
<h1>Tomates !</h1>

<p>Aujourd'hui j'ai <em>mangé</em> des
  <strong>tomates !</strong></p>
~~~

Un lien hypertexte. [Démo](http://jsfiddle.net/defeo/yjzhj5Lw/)

~~~
Si vous
<a href="http://www.uvsq.fr/">cliquez ici</a>
vous irez là.
~~~

Une image. [Démo](http://jsfiddle.net/defeo/61rya15h/)

~~~
À qui appartient ce logo :
<img src="http://www.uvsq.fr/images/logo.png" />
~~~

</section>
<section>

## Lectures

- W3Schools (en anglais) : <http://www.w3schools.com/html/default.asp>.

- Le cours de [OpenClassrooms](http://openclassrooms.com/courses/apprenez-a-creer-votre-site-web-avec-html5-et-css3).

- Le
  [guide de Mozilla](https://developer.mozilla.org/fr/docs/Web/HTML),
  avec la référence des
  [balises](https://developer.mozilla.org/fr/docs/Web/HTML/Element) et
  des
  [attributs](https://developer.mozilla.org/fr/docs/Web/HTML/Attributes).

</section>
