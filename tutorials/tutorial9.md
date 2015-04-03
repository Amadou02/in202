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

Nous allons utiliser quatre jeux de données :

- La liste des stations au deuxième semestre 2014 (fichier
  `divvy-stations.csv`).

- La liste des distances entre ces stations (fichier
  `divvy-distances.csv`)

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
stations  = pd.read_csv('datachallenge-in202/divvy-stations.csv',
                        parse_dates=['dateCreated'])
distances = pd.read_csv('datachallenge-in202/divvy-distances.csv')
trajets   = pd.read_hdf('datachallenge-in202/divvy-trips.h5', 'fixed')
meteo     = pd.read_csv('datachallenge-in202/meteo.csv',
                        parse_dates=['CST'])
~~~


## Analyse

Les questions du TD seront publiées le jour même. Il est vivement
conseillé de préparer un notebook IPython à partir des données
fournies plus haut, avec tout le pré-traitement que vous jugerez
utile.

### Statistiques sur les trajets <small>(3 points)</small>

1. Afficher les statistiques usuelles (nombre, moyenne, minimum,
   maximum, ...) sur la durée des trajets.

1. La durée des trajets est donnée en secondes. Afficher les
   statistiques du point précédent en minutes.

Les utilisateurs de Divvy sont divisés en deux catégories :
utilisateur à la journée, et abonné annuel. Les trajets des abonnés
annuels comportent en plus l'information sur le sexe et l'année de
naissance de l'abonné.

1. Représenter avec un diagramme en bâtons le nombre total de trajets
   par les abonnés et par les non abonnés.
   
   > On rappelle que la méthode `.plot()` de pandas peut prendre un
   > paramètre `.plot(kind="...")` permettant de spécifier le type de
   > diagramme à dessinner. Les diagrammes à bâtons s'appellent *bar
   > plots* en anglais et ont `kind="bar"`.

1. Trouver l'age de l'utilisateur le plus jeune, et du plus agé. On
   rappelle que les données datent de 2014.

1. Représenter avec un gâteau (*pie chart*, `kind="pie"`) le nombre de
   trajets effectués par les hommes et le nombre de trajets effectués
   par les femmes.

1. Dessiner le nombre total de trajets en fonction de l'age.
{: start="3" }

### Ajouter plus de données temporelles <small>(1 point)</small>

Chaque trajet comporte une heure de début et une heure de fin. Ces
données sont trop riches et ne nous permettent pas, par exemple, de
faire des statistiques par heure ou par jour.

Le code suivant permet de ré-indexer les données par heure de début,
et d'ajouter des colonnes `date`, `joursemaine` et `heure`,
correspondant respectivement à

- la date (sans heure),
- le jour de la semaine (0 à 6, avec 0 = Lundi, ...), et
- l'heure (entre 0 et 23).

~~~
trajets.set_index('starttime', inplace=True, drop=False)
trajets['date'] = T.index.date
trajets['joursemaine'] = T.index.weekday
trajets['heure'] = T.index.hour
~~~

1. Dessiner la durée moyenne des trajets par jour.

1. On remarque une régularité suspecte dans le diagramme
   précédent. Dessiner, avec un diagramme, en bâtons la durée moyenne
   des trajets par jour de la semaine.

### Croiser avec les données géographiques <small>(3 points)</small>

Les tables `trajets` et `distances` ont deux colonnes qui permettent
de faire le lien avec les stations :

- `from_station_id` : l'identifiant de la station de départ,
- `to_station_id` : l'identifiant de la station d'arrivée.

Ces colonnes correspondent aussi à la colonne `id` de la table
`stations`, mais nous ne nous servirons pas de cette dernière.

1. Fusionner les trajets avec les distances le long de ces colonnes.

1. Ajouter une colonne `vitesse`, calculée à partir de la distance et
   de la durée du trajet. La vitesse doit être exprimée en Km/h.

1. Afficher les statistiques usuelles sur la vitesse.

1. Dessiner la distance totale parcourue en fonction de l'age.

1. Le diagramme précédent n'est pas très intéressant : il ne fait que
   suivre la distribution des ages. Dessiner la vitesse et la distance
   moyennes en fonction de l'age.

1. Trouver l'année de naissance la plus rapide, afficher des
   statistiques détaillées.


### Pas de vie privée pour les vieux (et les menteurs) <small>(4 points)</small>

On vient de voir que la distribution des ages est une cloche très
aplatie aux extrémités. En plus, dès que l'on approche les grands
ages, les données en moyenne ne sont plus lisses, mais plutôt très
erratiques, ce qui est typique des échantillons trop petits.

Au vu de ces données, il est fort probable que les trajets aux
extrémités de la cloche correspondent à des utilisateurs uniques, par
conséquent nous allons pouvoir étudier les habitudes de quelques
utilisateurs choisis.

1. Afficher les statistiques usuelles sur la durée des trajets pour
   les utilisateurs centenaires (c'est à dire nés avant 1915, ou
   prétendant l'être), catalogués par sexe.

1. On va s'intéresser à l'utilisateur né en 1900, qui fait un gros
   usage du service (plus d'un trajet par jour). Pour fixer les idées,
   on va l'appeler John, le prénom le plus donné aux États-Unis en
   1900
   [d'après la sécurité sociale](http://www.ssa.gov/oact/babynames/decades/names1900s.html).

1. Afficher la vitesse moyenne de John. Faire une déduction hasardeuse
   sur son age réel.

1. Afficher les 5 stations de départ les plus utilisés par John.

1. Afficher les 5 stations d'arrivée les plus utilisées par John.

1. Afficher les 10 trajets les plus empruntés par John.

1. Pour chacune des catégories précédentes, afficher l'heure de départ
   moyenne. En faire une déduction sur où habite et où travaille John.

### Croiser avec les données météo <small>(bonus)</small>

Comme pour les trajets, les données météo comportent une colonne `CST`
correspondant à la date de l'observation météo. Cette colonne est au
format date+heure, alors que nous avons besoin uniquement de la
date. Comme auparavant, on ajoute une colonne `date` au DataFrame :

~~~
meteo.set_index('CST', inplace=True, drop=False)
meteo['date'] = meteo.index.date
~~~

1. Fusionner par date les données météo avec les données sur les
   trajets.

1. Dessiner le nombre de trajets en fonction de la température moyenne.

1. Le diagramme précédent, même s'il donne une idée des températures
   préférées par les cyclistes, est biaisé par le fait que certaines
   températures arrivent plus fréquemment que d'autres.
   
   Dessiner le nombre moyen de trajets par jour en fonction de la
   température moyenne.

1. Dessiner le nombre total de trajets en fonction du jour.

On voit clairement que le nombre de trajets diminue avec l'arrivée de
l'hiver. Par contre, il est plus difficile d'expliquer les variations
jour par jour, avec des différences qui peuvent atteindre le 30% des
trajets journaliers. Nous allons essayer de corréler cette donnée avec
les données météo.

Lisez comment
[utiliser directement matplotlib](http://pandas.pydata.org/pandas-docs/stable/visualization.html#plotting-directly-with-matplotlib)
sans passer par la méthode `.plot` de pandas. Ceci vous permettra de
superposer plusieurs graphes.

1. Reportez sur le même diagramme le nombre de trajets par jour et la
   température moyenne de la journée. Vous devrez normaliser ces
   valeurs (les rapporter à l'intervalle [-1,1], par exemple) pour
   pouvoir les comparer visuellement.

1. La colonne `Events` signale les jours où il a plu ou
   neigé. Reportez sur le même diagramme un point (utiliser un
   *scatter plot*) pour chaque jour où il y a eu un événement météo.

1. Dessiner la vitesse moyenne des cyclistes en fonction de la vitesse
   moyenne du vent. Comparer avec la déviation standard : observez
   vous une dépendance significative ?


### Autant emporte le vent (<small>bonus ultime, l'an prochain vous faites le cours à ma place</small>)

La colonne `WindDirDegrees` contient la direction du vent en degrés
(entre 0° et 359°), le nord étant à 0°, et l'est à 90°. On veut
déterminer comment la force du vent impacter la vitesse des
cyclistes.

- Pour chaque jour, utiliser les données géographiques pour diviser
  les trajets en trois catégories : ceux qui ont le vent derrière,
  ceux qui ont le vent de face, et ceux qui ont le vent de côté.

- Pour chacune de ces trois catégories, dessiner la vitesse moyenne en
  fonction de la vitesse du vent.

{: start="5" }
