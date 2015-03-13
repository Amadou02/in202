---
layout: post
title: Introduction à Python et IPython
plugins: highlight
---

<style>
td { border: solid thin black; }
</style>

Ce TD est à développer dans un *notebook IPython*. Si vous avez
installé IPython/Jupyter sur votre ordinateur, vous pouvez travailler
avec cette installation. Sinon, dirigez votre navigateur sur
<http://tmpnb.org>. Ce service gratuit met à votre disposition un
notebook temporaire *dans le cloud*.

Depuis la page d'accueil de IPython, créez un nouveau *notebook* en
cliquant sur *« New → Python 3 »*. Un notebook appelé *« Untitled »*
s'ouvre, vous pouvez changer son nom en cliquant dessus.

En dessous des barres de menu, le nouveau notebook contient une unique
*cellule*, identifiée par le texte `In [ ]:`. Tapez

~~~
1 + 1
~~~

dans la cellule, puis *évaluez* avec le bouton ▶. Le résultat s'affiche
en dessous de la cellule, et une nouvelle cellule vide est créée en
dessous.

Rentrez maintenant

~~~
print('Hello world!')
~~~

et évaluez en tapant `Shfit+Entrée` au clavier. Analysez la
sortie. Remarquez l'absence de l'indicateur `Out[2]:` à gauche de la
sortie.


**Attention :** <http://tmpnb.org> est un service temporaire. Lorsque
vous fermez votre navigateur, votre notebook est détruit. Pour garder
votre travail, téléchargez-le via le menu *« File → Download as →
IPython Notebook (.ipynb) »*. Essayez maintenant.

Ceci ne s'applique pas si vous utilisez votre propre installation du
notebook. Dans ce cas, en effet, les notebooks sont automatiquement
sauvegardés au format `.ipynb`, dans le dossier où vous avez lancé
IPython.


## Syntaxe, variables

Les variables en python ne sont pas déclarées. Elles peuvent prendre
tout type, et elles doivent être assignées avant d'être utilisées.

~~~
a = 10
a + 3
~~~

1. Essayez cet exemple dans le notebook
   
   ~~~
   message = "Thank you for sharing Python with the world, Guido!"
   print(mesage)
   ~~~
   
   Comprenez le message d'erreur et corrigez.

2. Stockez le message `"Hello,\n world!`" dans une variable et
   affichez-le en utilisant **deux commandes différentes**. Quelles
   différences remarquez-vous ?

3. Essayez ces exemples, comprenez les erreurs, et corrigez lorsque
   cela est possible
   
   ~~~
   nimportequoi
   ~~~
   
   ~~~
   adsflf_ = 10
   *adsflf_
   ~~~
   
   ~~~
   print('Hello'
   ~~~
   
   ~~~
   1v34
   ~~~
   
   ~~~
   print('Hello world")
   ~~~
   
   ~~~
   2000 / 0
   ~~~
   
   ~~~
   print("Hello world);
   ~~~

4. L'*indentation* et les retours à la ligne sont importants en
   Python. Testez ces exemples et corrigez si possible.
   
   ~~~
   a = 3
    a
   ~~~
   
   ~~~
     b = 10
     b
   ~~~
   
   ~~~
   a = 3 +
       2
   a
   ~~~
   
   ~~~
   a = 3 * (1
            + 4)
   a
   ~~~
   
   ~~~
   a = "Hello
        world!"
   a
   ~~~
   
   ~~~
   a = '''Hello
       world!
   '''
   print a
   ~~~

## Chaînes de caractères

Python possède *quatre* syntaxes pour les chaînes de caractères

~~~
"Hello"
'Hello'
"""Hello"""
'''Hello'''
~~~

Les guillemets doubles (`"`) ou simples (`'`) ne font pas de
différence. Les triples guillemets sont les seuls à autoriser les
retours à la ligne dans la chaîne.

Les chaînes sont **concatenées** avec l'opérateur `+`, et **répétées**
avec l'opérateur `*`.

1. Partant de cette cellule
   
   ~~~
   a = 'Hello'
   b = 'world'
   ~~~
   
   affichez `Hello, world!` en utilisant moins de 13 caractères.

1. Affichez `HelloHelloHelloHello` en utilisant moins de 3 caractères.

1. L'opérateur `%` effectue un remplacement similaire à la fonction
   `printf` de C. Testez la sortie de
   
   ~~~
   "%s, %s!" % (a, b)
   ~~~
   
   Modifiez la cellule pour obtenir l'affichage `Hello again, world`.

1. La fonction `str` transforme toute valeur en chaîne de
   caractères. Essayez-la sur un entier.


## Fonctionnement du notebook

1. Tapez les instructions suivantes, chacune dans sa cellule
   
   ~~~
   a
   ~~~
   
   ~~~
   a = 3
   ~~~
   
   ~~~
   a
   ~~~
   
   ~~~
   a = "Hello"
   ~~~
   
   ~~~
   a
   ~~~
   
   Maintenant sélectionnez la première cellule avec la souris et
   évaluez à nouveau. Que observez-vous ?
   
   Gardez bien en tête ce comportement : ce qui compte dans le
   notebook est l'**ordre d'évaluation**, signalé par le nombre entre
   crochets à gauche de la cellule, et non pas l'**ordre
   d'apparition**.

1. Tapez
   
   ~~~
   "Hello"
   "World"
   ~~~
   
   ~~~
   print("Hello")
   print("World")
   ~~~
   
   ~~~
   "Hello"
   print("World")
   ~~~
   
   ~~~
   print("Hello")
   "World"
   ~~~
   
   IPython n'affiche que la dernière des valeurs évaluées dans la
   cellule, mais il affiche aussi toutes les impressions.

1. Tapez
   
   ~~~
   a.
   ~~~
   
   puis la touche `TAB`. Dans le menu déroulant qui s'ouvre,
   sélectionnez la **méthode** `upper()` (vous pouvez appuyer à
   nouveau `TAB` après avoir tapé quelques lettres, mais il est votre
   responsabilité d'**ajouter les parenthèses à la fin**). Évaluez.

1. Tapez (en vous aidant avec l'auto-complétion)
   
   ~~~
   a.lower?
   ~~~
   
   lisez la documentation.

1. Tapez la touche `ESC`, puis la touche `h`. Étudiez la liste des
   raccourcis clavier, et essayez-en quelques uns.

1. Utilisez la raccourci `1` sur une cellule. Tapez du texte et
   évaluez. Même chose avec les raccourcis `2` et `3`.

1. Maintenant utilisez le raccourci `m` sur une cellule, et rentrez le
   texte suivant
   
   ~~~
   # Ceci est un titre
   
   Suivent des titres plus petits
   
   ## Niveau 2
   
   ### Niveau 3
   
   - C'est du HTML !
   - Et ça peut contenir même des liens,
   - grâce à [Markdown](http://daringfireball.net/projects/markdown/),
   ~~~

## Listes

Les listes en Python se créent avec la syntaxe

~~~
[1, 2, 3, 4]
~~~

Contrairement aux tableaux en C, elles peuvent contenir des objets de
plusieurs types différents.

1. Définissez la cellule suivante
   
   ~~~
   l = ["pomme", "poire", "banane", "raisin", "fraise", "litchi"]
   ~~~

1. Quelle est la longueur de la liste (**suggestion :** essayez la
   fonction `len`).

1. Affichez le troisième élément de la liste (**suggestion :** c'est
   comme en C).

1. Affichez le `-1`-ème élément de la liste (sisi !).

1. Tapez
   
   ~~~
   l[2:4]
   ~~~
   {:.python}
   
   Étudiez la sortie. Remarquez que les deux bornes sont
   optionnelles.

1. Affichez les 4 premiers éléments de la liste.

1. Affichez les 4 derniers éléments de la liste.

1. Les listes se concatènent et se répètent avec les opérateurs `+` et
   `*`, exactement comme les chaînes de caractères. Créez une nouvelle
   liste qui est une copie de `l`, avec l'ajout de `"cerise"`. Créez
   une liste qui est la répétition de cette dernière, quatre fois.

1. Les caractères d'une chaîne peuvent être sélectionnés exactement
   comme les éléments d'une liste. En partant de
   
   ~~~
   a = "Hello, world!"
   ~~~
   
   affichez `lo, wo`.

1. La fonction `list` transforme toute valeur en liste. Testez-la sur
   une chaîne de caractères.

1. Lisez la documentation de la méthode `a.join`. Testez-la.


## Dictionnaires

Python dispose d'un type absent en C : les dictionnaires.

1. Testez le code suivant
   
   ~~~
   voit = { "couleur"   : "rouge",
            "modele"    : "peugeot",
            "revisions" : [ 1996, 2001, 2006, 2011 ],
	      }
   voit["revisions"]	 
   ~~~

1. Testez le code suivant
   
   ~~~
   voit[4] = 101
   voit
   ~~~

1. En utilisant l'opérateur `%`, affichez de façon lisible les
   informations sur la voiture.


## `if`, `for`

On rappelle les syntaxe du `if` et du `for` en python

~~~
if a == b:
	...
elif b == c:
	...
else:
	...
~~~
{:.python}

~~~
for a in l:
	print(a)
~~~

La boucle `for` peut être utilisée exclusivement sur des **listes** et
des **dictionnaires**.

**ATTENTION : L'indentation est importante !**

1. Avec une boucle `for`, affichez uniquement les années paires de
   révision de la voiture définie à la section précédente.

1. La fonction `range(n)` crée la liste (plus exactement un
   *générateur*) des entiers de `0` à `n-1`.
   
   - Calculer la somme des entiers compris entre 0 et 100.
   - Calculer la somme des entiers divisibles par 3 compris entre 0
	 et 100.

1. Étudiez la documentation de la fonction `sum`. Récrivez le
   solutions du point précédent en une seule ligne.

1. Étudiez la documentation de la fonction `reversed`. Affichez la
   liste des entiers de 100 à 0 (vous aurez besoin de la combiner avec
   la fonction `list`).

1. Évaluez la cellule suivante
   
   ~~~
   o = { 'citron': 'fruit',
	     'pomme' : 'fruit',
         'chien' : 'animal',
		 'baobab': 'arbre',
	   }
   ~~~
   
   Avec une boucle `for`, imprimez toutes les affirmation du type
   *« le citron est un fruit »*.

1. IPython définit un tableau spécial `Out`, qui contient toutes les
   sorties jusqu'ici (pas les affichages faits avec
   `print`). Parcourez le tableau et affichez toutes les sorties qui
   font moins de 5 caractères.


## Fonctions

Les fonctions sont définies par le mot clef `def`. L'indentation est
encore une fois importante.

1. Écrire une fonction qui prend en paramètre un nom, et qui
   **renvoie** (pas de `print`) une phrase de bienvenue.

1. Créer une liste de 5 personnes. Appeler la fonction sur chaque
   personne à l'aide d'une boucle `for`.

1. Utilisez les fonctions `list(map(fonction, liste))` sur la fonction
   et la liste définies ci-dessus. Étudier le résultat.

1. Écrire une fonction `calc(gauche, op, droite)` qui prend en
   paramètre deux opérandes et une opération arithmétique et qui
   renvoie le résultat. Par exemple
   
   ~~~
   calc(3, '*', 5)
   ~~~
   
   donne 15. Supporter les opérateurs `*`, `+`, `-`, `/`, `//`, `%`,
   `^`.

1. Le mécanisme d'affichage de IPython fournit une fonctionnalité pour
   insérer du code HTML dans la sortie d'une cellule. Essayez ce code.
   
   ~~~
   from IPython.display import HTML
   HTML('<h3>AAA<br>A</h3>')
   ~~~
   
   Écrivez une fonction qui prend en paramètre un dictionnaire, et qui
   l'affiche dans un tableau HTML. Par exemple, le dictionnaire
   
   ~~~
   { "coleur": "rouge",
     "modele": "peugeot" }
   ~~~
   
   sera affiché comme ceci
   
   | coleur | rouge
   | modele | peugeot

## Zen

Pour terminer, un classique :

~~~
import this
~~~


## Notes

Ce TD a été en partie inspiré par le cours
<http://introtopython.org/>. N'hésitez pas à le lire pour des
approfondissements.
