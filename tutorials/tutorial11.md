---
layout: post
title: Prise en main de Lego NXT
plugins: highlight
---

## Préparation de l'espace de travail

Nous allons mettre en place les outils pour travailler avec les robots
Lego. Uniquement deux types de configuration nous permettent de faire
cela :

1. Vous avez installé Python 2.7 sur votre ordinateur, sans
   l'intermédiaire d'une machine virtuelle, par exemple la
   distribution [Anaconda](http://continuum.io/downloads). Vous avez
   installé le paquet nxt, par exemple avec la commande
   
   ~~~
   pip install nxt-python
   pip install pyusb
   pip install pybluez
   ~~~
   
   Alternativement, essayez ces téléchargements pour Windows :
   
   - <http://sourceforge.net/projects/pyusb/>
   - <https://code.google.com/p/pybluez/downloads/list>
   
2. Vous utilisez un cartable numérique. Avant de commencer, tapez cette
   commande pour installer IPython et nxt
   
	   curl https://gist.githubusercontent.com/defeo/b351fd20ca13b291b0d2/raw/939dd24ea5478251542ff49971946e5fb9addad2/apt.sh | /bin/bash

Nous allons utiliser principalement la connexion par cable
usb. Lorsque nous utiliserons le contrôle radio (via bluetooth), il
n'y a plus que la première configuration qui convient.

