---
layout: post
title: Divvy data challenge
plugins: highlight
---

Dans ce TD nous analysons les données d'utilisation du service de
partage vélos de Chicago Divvy.

Nous profitons de la mise à disposition libre de ces données par Divvy
à l'occasion de son data challenge :
<https://www.divvybikes.com/datachallenge>. Nous croisons ces données
avec des données météo, afin d'apprendre des informations sur les
pratiques d'utilisation du vélo dans la *windy city*.

**Attention :** ce TD compte pour le contrôle continu. Vous devez
rédiger vos réponses dans un notebook IPython, et envoyer votre
fichier `.ipynb` par mail à la fin de la séance de TD. Pour chaque
question, votre feuille doit contenir le code permettant de justifier
votre réponse.

## Les données

Nous allons utiliser trois jeux de données :

- La liste des stations au deuxième semestre 2014 (fichier
  `divvy-stations.csv`).

- La liste des trajets au deuxième semestre 2014 (fichier
  `divvy-trips.h5`).

- Données météo journalières de la ville de Chicago au deuxième
  semestre 2014 (fichier `meteo.csv`).

Le contenu de ces jeux de données est décrit ici :
<https://bitbucket.org/defeo/datachallenge-in202/src/>.

Pour importer les données dans votre espace de travail, ouvrez un
terminal (dans Sagemath Cloud : bouton « **⨁ New** », puis bouton
« **>_ Terminal** »), et tapez la commande

~~~
git clone https://bitbucket.org/defeo/datachallenge-in202.git
~~~
{:.bash}

Ensuite les jeux de données peuvent être importés dans un notebook
IPython avec les commandes

~~~
import pandas as pd
stations = pd.read_csv('datachallenge-in202/divvy-stations.csv',
                       parse_dates=['dateCreated'])
trajets  = pd.read_hdf('datachallenge-in202/divvy-trips.h5', 'fixed')
meteo    = pd.read_csv('datachallenge-in202/meteo.csv',
                       parse_dates=['CST'])
~~~


## Analyse

Les questions du TD seront publiées le jour même. Il est vivement
conseillé de préparer un notebook IPython à partir des données
fournies plus haut, avec tout le pré-traitement que vous jugerez
utile.
