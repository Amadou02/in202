---
layout: post
title: Collaboration à moyenne échelle
plugins: highlight
---

Nous allons développer un projet collaboratif sur moyenne échelle :
toute la classe va participer à un unique projet. Cela demande une
bonne dose de coordination, d'implication et de compréhension de la
part de tous. C'est dans l'intérêt de tous que chacun fasse la partie
du travail qui lui a été attribuée.

**Ce travail compte pour la deuxième note de contrôle continu. Il y
aura UNE SEULE NOTE, attribuée pour toute la classe. Il est impératif
d'avoir participé au projet (discussions dans les *Issues*,
utilisation des *Pull requests*) pour bénéficier de la note globale.**

Restez polis et respectueux des autres sur tous les canaux de
communication (mail, GitHub, communication orale, ...).

## Rejoindre l'organisation GitHub

Visitez la page de l'*organisation GitHub*
<https://github.com/in202-uvsq> et acceptez l'invitation.

Vous avez les droits en lecture (et en écriture si vous êtes *Release
manager*) sur le répertoire
<https://github.com/in202-uvsq/git-manual>.


## Le but

Le but du projet est de développer un manuel en ligne de Git. Il sera
servi à l'adresse <http://in202-uvsq.github.io/git-manual>.

Les *release managers* s'occupent de structurer le site en plusieurs
pages, de donner des conventions de travail (squelettes html à
respecter, types de balises et classes CSS à utiliser, ...). L'autre
responsabilité fondamentale des *release managers* est de recevoir les
*pull requests*, de vérifier qu'elles respectent les consignes, et de
les intégrer au répertoire principal lorsque cela est le cas.

Les autres développeurs se partagent le travail de construction du
site. Concrètement, vous serez divisés en groupes de trois personnes,
chaque groupe travaillant sur une page du site. Au sein de chaque
groupe, il sera opportun de déterminer un *task leader* qui s'occupe
d'intégrer les modifications de chaque participant et de créer la/les
*pull request* pour les *release managers*.

Tâchez de vous servir le plus possible des fonctionnalités de Git pour
partager votre travail et collaborer. Finalement, c'est sur votre
maîtrise de l'outil Git que vous serez évalués.

**La limite pour la livraison du projet est le jeudi 12 mars à
minuit. PAS DE *PULL REQUESTS* APRÈS 20 !**


## Les outils de collaboration

Pour collaborer productivement, il vaudra mieux se servir des outils
déjà fournis par GitHub.

Les [*Issues*](https://github.com/in202-uvsq/git-manual/issues)
permettent de tenir trace des tâches à réaliser et des bugs à
fixer. Le prof a créé une issue pour chacune des pages à réaliser, et
indiqué dans sa description qui sont les élèves
*assignés*. L'interface vous permet de commenter et discuter chaque
issue, servez-vous-en pour vous coordonner.

Le [*Wiki*](https://github.com/in202-uvsq/git-manual/wiki) est, comme
le nom l'indique, un wiki dédié au projet. Servez-vous en pour
documenter les conventions de codage, la méthode de travail, etc.

Aussi bien les issues que le wiki supportent un mode d'édition riche,
permettant de saisir des titres, du gras, de l'italique, du code
source, ... Il s'agit d'une syntaxe de type wiki, définie par la
variante Github du langage Markdown (GFM).
[La documentation de GFM est ici](https://guides.github.com/features/mastering-markdown/).


## Faire un *fork* pour travailler

Puisque vous n'avez pas les droits en écriture sur le répertoire
central (et même si vous les avez), vous allez devoir faire un *fork*
de celui-ci pour partager vos modifications avec vos camarades, et
pour créer les pull requests.

Créez un *fork* en cliquant sur le
[bouton *fork*](https://github.com/in202-uvsq/git-manual/fork), puis
clonez **votre fork** sur votre ordinateur local. La procédure est
aussi décrite
[dans le wiki](https://github.com/in202-uvsq/git-manual/wiki/Forker-correctement-et-cr%C3%A9er-une-pull-request),
avec des explications détaillées sur la façon de synchroniser **votre
fork** avec le **répertoire central**.

Pour partager votre travail au sein des petits groupes assignés à
chaque tâche, vous avez la liberté du choix :

- Le *task leader* donne accès en écriture à son *fork* aux autres
  membres du groupe.

- Chaque membre travaille sur son propre *fork*, et envoie son travail
  au *task leader* avec une *pull request*.
