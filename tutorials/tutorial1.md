---
layout: post
title: Premiers pas en HTML et CSS
---

## Ma première page HTML

Dans cette partie nous allons construire une simple page HTML, qui va
nous permettre de découvrir les balises HTML les plus communes.

Nous allons travailler avec l'outil Thimble de Mozilla
(<https://thimble.webmaker.org/>), qui permet d'éditer du code HTML en
affichant le résultat à la volée.

Si vous avez crée un compte, vous avez la possibilité de sauvegarder
vos projets et de continuer le travail depuis un autre ordinateur.  La
liste de tous vos projets sauvegardés est disponible à l'adresse
<https://webmaker.org/me>.

Une fois votre projet sauvegardé, le bouton *"View"* en haut à droite
permet de le visualiser dans une fenêtre à part.

La
[liste des balises HTML](https://developer.mozilla.org/fr/docs/Web/HTML/Element)
va vous aider à résoudre les exercices de cette partie. Lisez avec
attention la description de chacune des balises avant de vous en
servir.

1. Créez un **paragraphe** de texte, contenant du **gras** et de
   l'*italique* (balises `<p>`, `<em>`, `<strong>`, `<i>` et `<b>`).

2. Ajoutez un ou plusieurs titres (balises `<h1>` à `<h6>`).

3. Ajoutez des listes à puces et des listes numérotées (balises
   `<ul>`, `<ol>`, et `<li>`).

4. Ajoutez une liste de définitions (balises `<dl>`, `<dd>` et `<dt>`).

5. Ajoutez une poésie (balise `<pre>`).

6. Ajoutez un tableau (balises `<table>`, `<tr>`, `<td>` et `<th>`).

7. Ajoutez une image et des liens (balises `<img>` et `<a>`).

8. Ajoutez des liens internes (balise `<a>` et attribut `id`).

9. Organisez votre texte en le séparant en sous-parties avec les
   balises `<section>`, `<article>`, `<header>`,
   `<footer>`. Observez-vous des changements dans l'affichage ?


## Premiers pas avec CSS

Nous allons maintenant ajouter un peu de style à la page que nous
venons de créer. Ici, nous allons nous servir uniquement de l'attribut
`style` pour appliquer des directives CSS à des balises spécifiques.

Aidez vous avec la
[liste des propriétés CSS](https://developer.mozilla.org/fr/docs/Web/CSS/Reference).

1. Changez la police du `<body>` (propriétés `font-family`,
   `font-size` et `font`)

2. Mettez en italique la poésie (propriété `font-style`).

3. Mettez en gras les `<dt>` (propriété `font-weight`).

4. Ajoutez de l'espace autour du tableau (propriétés `margin-left`,
  `margin-right`, `margin-top`, `margin-bottom` et `margin`).

5. Modifiez la couleur du texte et du fond des titres (propriétés
   `color` et `background-color`)

6. Encadrez les sections (propriétés `border-size`, `border-color`,
   `border-style` et `border`).

7. Ajoutez de l'espace à l'intérieur de cadre des sections (propriétés
   `padding-left`, `padding-right`, `padding-top`, `padding-bottom` et
   `padding`).

8. Ajoutez de l'espace autour des cadres.

9. À l'aide de la balise `border`, séparer le `<header>` par une ligne
   en dessous, et le `<footer>` par une ligne en dessus.

10. Déplacez l'image à un endroit fixe de la page (propriétés
	`position`, `left`, `right`, `top` et `bottom`).

11. Faites en sorte que le texte soit superposé à l'image (propriété
    `z-index`).


## Donner du style à une page

Nous allons maintenant séparer la forme du contenu, en mettant toutes
les directives dans l'entête du document HTML.

Modifiez
[ce thimble](https://thimble.webmaker.org/en-US/project/120990/edit)
comme indiqué dans son texte.
