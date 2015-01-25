---
layout: slideshow
title: Forme et contenu
subtitle: CSS
---

<section>

## Séparer forme et contenu

Tous les *langages de balisage* sont fondés sur le mêmes principes :

- L'auteur doit pouvoir se concentrer uniquement sur le **contenu**.

- Les directives de **mise en forme** sont séparées du contenu.

### Exemples de directives de mise en forme

- *Codées en dur* dans le logiciel (Scribe, HTML 1.0, ...)

- Définies dans les *entêtes* (LaTeX, HTML/CSS, ...)

- Définies dans un fichier séparé (LaTeX `.cls`, HTML/CSS, ...)

- Définies à l'aide d'un langage externe (HTML/CSS, ...)

- Non définies dans le standard (XML, ...)

</section>
<section>

## Exemple : HTML

Les balises HTML renseignent sur la **signification** (la
**sémantique**) des données, pas sur la façon de les **présenter**.

Exemple : la balise controversée `<i>` (à l'origine, *italique*)

~~~
<i>Some text</i>
~~~

> *Some text*

Cependant, la spécification HTML5 dit :

> The i element now represents a span of text in an alternate voice or
  mood, or otherwise offset from the normal prose in a manner
  indicating a different quality of text, such as a taxonomic
  designation, a technical term, an idiomatic phrase from another
  language, a thought, or a ship name in Western texts.
{:.cite}

</section>
<section>

## Navigation web et affichage

**Ne jamais faire d'assomptions sur l'affichage**

Pensez à

- Browsers en mode texte ;

- Différentes tailles d'écran (mobile, tablette, ...) ;

- Utilisateurs malvoyants ;

- Utilisateurs qui lisent dans des langues étrangères (qui pourraient
  ne pas posséder un concept similaire à l'*italique*) ;

- Site tiers qui pourraient réutiliser votre contenu.

Donc, qui décide de l'affichage ?

Les **Feuilles de style**.
{:.centered}

</section>
<section>

# CSS

</section>
<section class="compact">

## Cascading Style Sheets

CSS est un langage pour l'expression de directives d'affichage.

**Cascading** veut dire que plusieurs feuilles de style peuvent
s'appliquer à un document, le résultat est calculé d'après des règles
de precedence *en cascade*.
  
~~~
p.lead {
  font-weight: bold;
  font-family: "Gill Sans MT", GillSans, sans-serif;
  padding: 2pt;
}

p.lead:first-letter {
  font-size: 200%;
}

p.lead em {
  font-variant: small-caps;
  font-style: normal;
}
~~~

<style>
p.lead {
  font-weight: bold;
  font-family: "Gill Sans MT", "Gill Sans", GillSans, sans-serif;
  padding: 2pt;
}

p.lead:first-letter {
  font-size: 200%;
}

p.lead em {
  font-variant: small-caps;
  font-style: normal;
}
</style>

<p class="lead">Lorem ispsum <em>dolor sit</em> amet</p>

</section>
<section class="compact">

## HTML et CSS

~~~
<html>
  <head>
    <!-- Ceci s'applique à tout le document -->
    <link rel='stylesheet' href='sheet.css' type='text/css' />
    <style>
      body {font-family: Arial;}
    </style>
  </head>
  <body>
    <div>
      <!-- Ceci s'applique seuelement dans ce div -->
      <style scoped>
        p {color:blue;}
      </style>
      <!-- Ceci s'applique seulement à ce paragraphe
           La syntaxe CSS y est limitée -->
      <p style="font-weight:bold">...</p>
    </div>
  </body>
</html>
~~~

</section>
<section>

## Où va le CSS

L'attribut HTML `style` applique des **directives CSS** à une balise.

~~~
<p style="font-weight: bold; color: red">
  Ce texte en <em>gras et rouge</em>.
</p>
~~~

La balise `<style>` insère un **document CSS** dans
l'entête. [Démo](https://thimble.webmaker.org/project/120920/edit).

~~~
<head>
  <style>
    p { color: red }
  </style>
</head>
<body>
  <p>Ce texte en <em>gras et rouge</em>.</p>
</body>
~~~

</section>
<section>

## Autres formes

Balise `<style scoped>` dans le corps

~~~
<section>
  <p>Lorem ipsum ...</p>
  <p>
    <style scoped> p { color: red } </style>
	dolor sit amet ...
  </p>
</section>
~~~

Inclure des fichiers `.css` externes

~~~
<head>
  <link rel='stylesheet' href='style1.css' />
  <link rel='stylesheet' href='style2.css' />
  ...
</head>
~~~

</section>
<section class="compact">

## La syntaxe CSS

**Règles CSS**

~~~
selector {property: value; property:value; ...}
~~~

**Commentaires**

~~~
/* Ceci est la seul façon de faire des commentaires en CSS
   (en effet, // n'introduit pas un commentaire)       */
~~~

**At-rules**

~~~
@import "unautrestyle.css";  /* Importe dans la feuille
                                courante */
@media screen;               /* S'applique seulement à un
                                affichage sur écran (par ex.,
								pas à l'impression) */
~~~

Référence actuelle: <http://www.w3.org/TR/2011/REC-CSS2-20110607/>

Le draft CSS3 est trop grand pour tenir en un seul module. Voir <http://www.w3.org/Style/CSS/>

</section>
<section class="compact">

## Sélecteurs CSS

**Sélecteurs simples (`tag` est toujours optionnel)**

~~~
tag {...}                /* Toute balise <tag>            */
tag.class {...}          /* Tout <tag> de classe class    */
#id {...}                /* La balise identifiée par id   */
tag:pseudoclass {...}    /* Sélection de contenu spécial  */
tag[att=val] {...}       /* Tout <tag> ayant attribut att
                            égal à val                    */
~~~
{:.css}

**Combinateurs de sélecteurs**

~~~
selector, selector {...} /* Chacun des selector                */
parent child {...}       /* child s'il est un fils de parent   */
parent > child {...}     /* child seulement s'il est un fils
                            direct de parent                   */
sister ~ brother {...}   /* brother seulement s'il suit sister */
sister + brother {...}   /* brother seulement s'il suit
                            immediatement sister               */
~~~

Référence complète: <http://www.w3.org/TR/CSS2/selector.html>

Draft CSS3: <http://www.w3.org/TR/2011/REC-css3-selectors-20110929>

</section>
<section>

## Le *box model*

Il y a trois types de **boîtes** en CSS :

<div style="background-color: yellow">
**Bloc:** Un *bloc* est un rectangle. Il prend toute la largeur et
autant de hauteur que nécessaire.
</div>

**Inline:** <span style="background-color:yellow"> Les *inlines* se
comportent comme des lignes de texte, qui reviennent à la ligne
lorsqu'elles atteignent la marge. Elles prennent seulement l'espace
qu'elles occupent.</span>

<div style="display:inline-block;width:60%;background-color:yellow">
**Inline-block:** Les *inline blocks*, comme les blocs, ne reviennent
pas à la ligne.  Mais, comme les inline il peut y en avoir plusieurs
sur une même ligne, et ils ne prennent que l'espace qu'ils occupent.
</div>

<div style="display:inline-block;background-color:red;width:35%">

Je prends peu de place

</div>

</section>
<section>

## Le *inline*, le *block* et le truand

Il y a des règles sur quelles balises peuvent aller dans quelles
autres. Au vieux temps, il y avait deux catégories :

- Les blocs peuvent aller dans les blocs,
- Les inlines peuvent aller dans les inlines ou les blocs,
- Les blocs ne peuvent pas aller dans les inlines.

Depuis l'introduction de la propriété `display` en CSS, on peut
changer le type de boîte d'une balise ; et avec HTML5 les règles se
sont encore complexifiées.

- Blocs par défaut: **`<div>`**, `<hX>`, `<p>`, ...
- Inlines par défaut: **`<span>`**, `<a>`, `<em>`, `<img>`, texte simple, ...


</section>
<section>

## Le *flux*

Dans le **flux normal**, les boîtes disposées du **haut vers le bas**
et de **gauche à droite** (mais le dernier peut être changé).

Les boîtes peuvent **sortir du flux** en étant positionnées
explicitement, grâce à la propriété CSS `position`:

- **static:** Le flux par défaut.
- **absolute:** Positionnement en coordonnées X-Y par rapport au bloc
  conteneur.
- **fixed:**  Positionnement en coordonnées X-Y par rapport à l'écran.
- **relative:** Positionnement en coordonnées X-Y par rapport au point
  où l'élément se serait positionné normalement.

Les boîtes peuvent aussi sortir du flux en **floattant** (propriété `float`).

</section>
<section>

## Un peu de pratique

Expérimenter avec une page unique : [Mozilla Thimble](https://thimble.webmaker.org/).

Expérimenter avec CSS et HTML : [JSFiddle](http://jsfiddle.net/).

Dans votre browser, les **Outils du développeur** permettent
d'explorer les composants d'une page web et le box model.

**Firefox:** `F12`, `Shift+Ctrl+C`, .

**Chrome:** `F12`.

</section>
<section>
