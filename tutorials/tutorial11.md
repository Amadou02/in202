---
layout: post
title: Prise en main de Lego NXT
plugins: highlight
---

Dans ce TD nous allons apprendre à contrôler les kits de robotique
Lego NXT par du code écrit en python.

## Préparation de l'espace de travail

Après moultes heures passées à essayer toutes sortes de
configurations, nous avons pu en trouver uniquement deux qui
permettent de se connecter (autrement que par l'IDE fourni par Lego)
aux contrôleurs NXT. Les deux solutions sont basées sur Linux.

1. Démarrer un cartable numérique ou un ordinateur personnel sur un
   système Linux installé sur une clef usb. Cette configuration est la
   seule qui permette de se connecter aux robots via bluetooth.
   
   Pour cela, insérez la clef usb qui vous aura été fournie. Allumez
   l'ordinateur et entrez dans le *menu de boot*. Choisissez la clef
   usb pour périphérique de démarrage.
   
   Pour accéder au *menu de boot* sur les cartables numériques, gardez
   appuyée la touche `ECHAP` immédiatement après avoir allumé
   l'ordinateur. Choisissez ensuite l'option F9, et sélectionnez la
   clef usb.
   
   Pour accéder au *menu de boot* sur un autre ordinateur de marque
   HP, les mêmes touches vont probablement marcher. Pour les autres
   marques, essayez les touches `ECHAP`, `F2`, `F10` ou `F12`...
   
   **Note :** si vous le souhaitez, vous pouvez créer votre propre
   clef usb démarrable. Il vous faudra une clef vide d'au moins
   2GB. Vous pouvez télécharger le système
   <http://proust.prism.uvsq.fr/~dfl/in202-live.iso> (1.2Go)

   **Note :** certaines machines récentes semblent interdire tout
   démarrage dans un système autre que le système vendu à
   l'origine. Pour ces machines, la seule solution possible sera la
   deuxième, à moins de n'être prêts à configurer votre matériel, et
   potentiellement invalider la garantie.

2. Démarrer un système Linux dans une machine virtuelle Virtualbox,
   avec les extensions USB activées. Par exemple celle-ci :
   <http://proust.prism.uvsq.fr/~dfl/ipython-appliance.zip>
   (500Mo). Cette configuration ne permettra de se connecter aux
   robots qu'en usb.
   
   Si cette VM refuse de démarrer, vérifiez que les options de
   virtualisation sont activées dans votre BIOS. Pour accéder au BIOS,
   procédez comme au point précédent.
   
   Une fois la machine démarrée, dirigez votre browser à l'adresse
   <http://localhost:8888>, et utilisez le notebook IPython pour
   contrôler le robot.

## Contrôler les moteurs et les capteurs


## Le suiveur


## Connexion au *brick*

Pour contrôler le robot, connectez-le par câble USB à votre
ordinateur. Appuyez ensuite sur le bouton orange pour allumer le
robot.

Dans un notebook IPython, tapez la commande suivante.

~~~
import nxt
b = nxt.find_one_device()
~~~

L'objet `b` représente l'état de votre robot, et vous permet de le
contrôler. Pour afficher les informations sur le robot, tapez

~~~
b.get_device_info()
~~~

Notamment

~~~
print b.get_device_info()[0]
~~~

affichera le nom du robot (initialisé à `NXT-x`, où `x` est le numéro
inscrit sur le *brick*).

**Note :** Si votre ordinateur est muni de bluetooth, et que vous
n'utilisez pas une machine virtuelle, il vous est aussi possible de
vous connecter au robot via radio. Veuillez lire
[l'annexe sur la connexion bluetooth](#connexion-en-bluetooth)



## Connexion en bluetooth

Si votre ordinateur est muni de bluetooth, et que vous n'utilisez pas
une machine virtuelle, il vous est possible de vous connecter au robot
via radio, éliminant ainsi la contrainte du cable usb.

Le bluetooth est un patchwork de protocoles capricieux, horriblement
mal conçu par un
[organisme de standardisation schizophrène](https://en.wikipedia.org/wiki/Bluetooth_Special_Interest_Group),
et incroyablement mal supporté sous Linux. Ceci n'empêche pas de
réussir à faire marcher, bien ou mal, dans un bon nombre de
circonstances.

Si vous avez démarré sur la clef usb fournie pour le TD, la solution
qui semble être la plus stable pour une connexion via bluetooth semble
revenir à taper cette commande dans le notebook :

~~~
!timeout 20 bt-adapter -d
~~~

avant de procéder comme d'habitude :

~~~
b = nxt.find_one_device(name='NXT-1')
~~~

Remplacez `NXT-1` par le nom de votre *brick*. Après quelques
secondes, la *brick* vous signalera une demande de couplage, et vous
demandera de rentrer un code d'identification, pré-saisi à `1234`. Ne
changez pas le code, et appuyez sur la touche orange. À ce moment là,
un popup s'affichera sur votre ordinateur, vous demandant de saisir le
même code. Rentrez `1234` et validez. Vous êtes maintenant connecté
via bluetooth.

Si vous n'arrivez pas à utiliser le bluetooth sur votre ordinateur, il
est toujours possible d'ouvrir un notebook à distance sur un
ordinateur correctement configuré. Demandez au professeur de mettre en
place pour vous une telle infrastructure lorsque cela sera nécessaire.
