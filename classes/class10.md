---
layout: slideshow
title: Lego NXT
plugins: highlight
---

<section>

## Lego NXT

Des kits de robotique, produits par la fameuse maison danoise.

- Un contrôleur, appelé *brick* ;
- Des *servo-moteurs*, jusqu'à trois par brick ;
- Des capteurs, jusqu'à quatre par brick :
  - Capteur de contact,
  - Capteur de lumière RGB,
  - Capteur de distance à ultrasons,
  - Capteur de son (arrêté en 2009),
  - D'autres capteurs produits par des partenaires ;
- Un protocole de communication entre bricks via bluetooth.

Programmables :

- Par microprogramme, transféré dans la mémoire du *brick*,
- Contrôle interactif via USB,
- Contrôle interactif via Bluetooth.

</section>
<section>

## Langages pour NXT

Langages pour compilation sur la plateforme :

- NXT-G : IDE de programmation graphique officiel,
- C#, IronPython et VB.NET avec MS Robotics Developer Studio,
- BricxCC, Next Byte Codes, [Not eXactly C](http://bricxcc.sourceforge.net/nbc/) (NXC),
- NXTGCC,
- Simulink,
- leJOS NXT (Java),
- [PyNXC](https://code.google.com/p/pynxc/), ...

Interfaces interactives :

- MATLAB,
- ruby-nxt,
- C_NXT,
- [NXT-Python](https://code.google.com/p/nxt-python/) : notre choix, ...

Wikipedia a une [liste plus longue](https://en.wikipedia.org/wiki/Lego_Mindstorms_NXT).

</section>
<section>

# NXT-Python

~~~
import nxt
~~~
{:.python}

</section>
<section>

## Connexion à un brick

Une seule fonction : `find_one_brick()`.

Renvoie un objet de type brick

~~~
b = nxt.find_one_brick()
~~~
{:.python}

On peut, par exemple, afficher des informations sur le brick

~~~
b.get_device_info()
~~~
{:.python}

</section>
<section>

## Nommer les bricks

Pour afficher uniquement le nom du brick (`NXT` par défaut) :

~~~
print b.get_device_info()[0]
~~~
{:.python}

On peut renommer un brick pour un usage futur

~~~
b.set_brick_name('NXT-1')
~~~
{:.python}

Les fois suivantes, on pourra forcer la connexion au même brick avec

~~~
b = nxt.find_one_brick('NXT-1')
~~~
{:.python}

</section>
<section>

## Attendre

Ne rien faire pendant x secondes

~~~
nxt.time.sleep(0.5)
~~~
{:.python}

Éviter que le brick se mette en veille

~~~
b.keep_alive()
~~~
{:.python}

### Synchrone vs asynchrone

**Important :** NXT-Python est une bibliothèque **synchrone** :

- Tout appel de fonction bloque l'exécution jusqu'à la fin de
  l'action.
- Parallélisme possible avec les *threads* ou autre mécanisme de haut
  niveau.

</section>
<section>

## Jouer un son

Jouer une note (fréquence, durée en ms)

~~~
# Joue un La 440Hz pendant une seconde
b.play_tone_and_wait(440, 1000)
~~~
{:.python}

Jouer une note sans attendre la fin (asynchrone)

~~~
b.play_tone(440, 1000)
~~~
{:.python}

Jouer un fichier enregistré sur le brick (asynchrone)

~~~
# Joue 'sound.rso' en boucle pendant une seconde
b.play_sound_file(True, 'sound.rso')
nxt.time.sleep(1000)
b.stop_sound_playback()
~~~
{:.python}

[Exemple](https://code.google.com/p/nxt-python/source/browse/trunk/examples/mary.py).

</section>
<section>

## Servo-moteurs

Les moteurs sont représentés par des objets de type `Motor`.

Paramètres : le brick, le port de connexion.

~~~
m = nxt.Motor(b, nxt.PORT_A)
~~~
{:.python}

Actionner le moteur (asynchrone) :

~~~
m.run()
~~~
{:.python}

avec une puissance (entre -127 et 128)

~~~
m.run(100)
~~~
{:.python}

Arrêter le moteur :

~~~
m.brake()
~~~
{:.python}

</section>
<section>

## Contrôle des servo-moteurs

Faire tourner un moteur sur une distance fixe

- Puissance : entre -127 et 128
- Degrés : de combien de degrés faire tourner le moteur (suggéré > 50)

~~~
m.turn(100, 360)
~~~
{:.python}

Connaître l'angle du moteur :

~~~
m.get_tacho()
~~~
{:.python}

Remettre à zéro l'angle

~~~
m.reset_position()
~~~
{:.python}

[Exemple](https://code.google.com/p/nxt-python/source/browse/trunk/examples/spin.py)

</section>
<section>

## Servo-moteurs synchronisés

Faire tourner deux moteurs de façon synchronisée

~~~
m_gauche = nxt.Motor(b, nxt.PORT_A)
m_droite = nxt.Motor(b, nxt.PORT_B)

# Robot avance droit
s = nxt.SynchronizedMotors(m_gauche, m_droite, 1)
s.run()
~~~
{:.python}

Faire courber le robot

~~~
# Roue gauche tourne 2 fois plus vite
s = nxt.SynchronizedMotors(m_gauche, m_droite, 2)
s.run()
~~~
{:.python}

</section>
<section>

## Capteurs

Les capteurs sont représentés par des objets de type `Touch`, `Light`,
`Ultrasonic` ou `Sound` (plus d'autres objets pour des capteurs
non-officiels).

~~~
t = Touch(b, PORT_1)
l = Light(b, PORT_2)
u = Ultrasonic(b, PORT_3)
s = Sound(b, PORT_4)
~~~
{:.python}

Obtenir les valeurs

~~~
t.get_sample()
~~~
{:.python}

Valeur de retour dépendant du senseur :

- Touch : `True`/`False`,
- Light : entier (intesité lumineuse),
- Ultrasonic : entier (distance),
- Sound : entier (intensité sonore).

[Exemple](https://code.google.com/p/nxt-python/source/browse/trunk/examples/test_sensors.py)

</section>
<section>

## Messages

Protocole d'échange entre bricks (max 1Ko, max 4 connexions)

**Écrire.** Paramètres :

- Boîte à messages,
- message.

~~~
b.message_write(0, 'hello world')
~~~
{:.python}

**Lire.** Paramètres :

- Boîte,
- ??,
- synchrone/asynchrone

~~~
boite, msg = b.message_read(0, 0, True)
~~~
{:.python}

</section>
<section>

## Lectures

- [Documentation](https://code.google.com/p/nxt-python/w/list),
- [Exemples](https://code.google.com/p/nxt-python/source/browse/trunk#trunk%2Fexamples).

</section>




