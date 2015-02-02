---
layout: slideshow
title: Mise en page avec CSS
---

<section>

## Mise en page

### Problématique

- Distribuer le contenu dans la page.
- S'adapter à des modes d'affichage différents (écran, mobile,
  impression, ...).
- Permettre un certain degré de *non-linéarité*.

### Modes de mise en page en CSS

- *Box model* (le plus ancien),

- *Positionnement absolu* (aussi ancien),

- *Flexbox* (le nouvel arrivant),

- *Grille* (encore dans les cartons...)

</section>
<section>

# Le *box model*

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

Il y a des règles sur quelles boîtes peuvent aller dans quelles
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

### Flux normal

Dans le **flux normal**, les boîtes sont disposées du **haut vers le
bas** et de **gauche à droite** (mais le dernier peut être changé).

### Floats

Les boîtes peuvent sortir du flux en **flottant** :

- `float: left`
- `float: right`

Uniquement utile pour insérer des figures dans un texte.


</section>
<section>

# Positionnement absolu

</section>
<section>

## Les types de positionnement

En plus de la propriété `float`, les boîtes peuvent **sortir du flux**
en étant positionnées explicitement, grâce à la propriété CSS
`position`:

- `static` : Le flux par défaut.

- `absolute` : Positionnement en coordonnées X-Y par rapport au bloc
  conteneur.

- `fixed` :  Positionnement en coordonnées X-Y par rapport à l'écran.

- `relative` : Positionnement en coordonnées X-Y par rapport au point
  où l'élément se serait positionné normalement.

Les coordonnées de positionnement sont spécifiées par les propriétés
`left`, `right`, `top` et `bottom`.

</section>
<section>

# Flexbox

</section>
<section>

## Flexbox

### Limitations du *box model*

- Centrer verticalement.
- Layout en colonnes (traditionnellement simulé avec `float`,
  `display`, `position`, dimensions fixes, etc., voire même avec
  `<table>`).
- Adaptation à la taille de l'écran.
- *Non-linéarité*.

### Flexbox

- Un modèle de boîtes *agnostique par rapport à la direction*.
- Basé sur un *conteneur* et ses *éléments*.
- Algorithmes de calcul de taille et espacement.
- *Non-linéaire*

</section>
<section>

## Les propriétés CSS de flexbox

#### Propriétés principales du *conteneur*

- `display: flex` déclare un *conteneur* flexible.
- `flex-flow: row nowrap` déclare la *direction* et le mode de retour
  à la ligne.

#### Propriétés principales des *éléments*

- `flex: 0 1 auto` déclare l'*élasticité* d'un *élément*.
- `order: 1` permet de réaliser un affichage *non-linéaire*.

#### Autres propriétés

- Conteneur : `flex-direction`, `flex-wrap`, `justify-content`,
  `align-items`, `align-content`.

- Éléments : `flex-grow`, `flex-shrink`, `flex-basis`, `align-self`.

</section>
<section>

# Pour conclure

</section>
<section>

## Utiliser des frameworks

- CSS est un standard géant.
- Les parties expérimentales sont en constante évolution.
- Assurer la compatibilité avec les vieux navigateurs est un
  cauchemar.
- Les problématiques de mise en page peuvent procurer des maux de
  tête.

Laissez faire cela aux experts : utilisez un *frontend framework*.

## Exemples

- Bootstrap <http://getbootstrap.com/> (Twitter)
- Pure CSS <http://purecss.io/> (Yahoo)
- ...

</section>
<section>

## Autres usages avancés de CSS

- Transformations 2D et 3D.
- Animations, transitions.
- Adaptation à la taille d'écran (*responsive layout*).
- Pagination.
- ...


</section>
