---
layout: post
title: Gitopardy!
plugins: highlight
styles:
  - "../../assets/explain-git-with-d3/css/explaingit.css"
  - "../../assets/tutorial5-d3.css"
---

<script data-main="../../assets/explain-git-with-d3/js/main" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.4/require.js"></script>

Cette partie teste votre compréhension de Git. Pour chaque question,
vous devez choisir une unique réponse. Vous avez un seul essai par
question ; si vous devinez la bonne réponse vous gagnez des points.

Prenez tout le temps nécessaire à réfléchir. N'hésitez pas à vous
servir du cours, ou à faire des essais avec Git avant de répondre.

Votre score est de : **<span class="score">0</span> points !**

1. On considère un répertoire avec deux branches dans l'état suivant
   
   <div id="merge" class="git-d3"></div>
   
   Quel sera l'état du répertoire après la commande `git merge dev` ?
   
   <div class="choice">
   <div id="merge-right" data-score="10" class="git-d3"></div>
   <div id="merge-wrong-1" class="git-d3"></div>
   <div id="merge-wrong-2" class="git-d3"></div>
   </div>

2. Quel est l'effet de la commande `git pull --ffonly` sur le
   répertoire suivant :
   
   <div id="ff-only" class="git-d3"></div>
   
   - La branche `origin/master` est *mergée* dans `master`.
   - La branche `master` est *mergée* dans `origin/master`.
   - Aucun.
   {:.choice data-choice="3" data-choice-score="10"}

2. On considère un répertoire avec deux branches dans l'état
   suivant
   
   <div id="branch" class="git-d3"></div>
   
   Quel sera l'état du répertoire après la commande `git branch dev` ?
   
   <div class="choice">
   <div id="branch-right" data-score="10" class="git-d3"></div>
   <div id="branch-wrong-1" class="git-d3"></div>
   <div id="branch-wrong-2" class="git-d3"></div>
   </div>

3. Dire quelle commande permet de passer de cet état
   
   <div id="pull-1"></div>
   
   à cet autre état
   
   <div id="pull-2"></div>
   
   - `git fetch`
   - `git pull`
   - `git merge`
   {:.choice data-choice="2" data-choice-score="10"}

4. On considère un répertoire dans l'état suivant
   
   <div id="checkout"></div>
   
   Quel sera le résultat de la commande `git checkout dev` ?
   
   <div class="choice">
   <div id="checkout-wrong-1"></div>
   <div id="checkout-right" data-score="10"></div>
   <div id="checkout-wrong-2"></div>
   </div>

5. On considère un répertoire dans l'état suivant
   
   <div id="reset"></div>
   
   Quel sera le résultat de la commande `git reset dev` ?
   
   <div class="choice">
   <div id="reset-wrong-1"></div>
   <div id="reset-wrong-2"></div>
   <div id="reset-right" data-score="10"></div>
   </div>

6. Voici la sortie de la commande `git status`
   
   ~~~
   On branch master
   Your branch is behind 'origin/master' by 2 commits, and can be fast-forwarded.
   ~~~
   {:.bash}
   
   Lequel de ces diagrammes correspond à cette description ?
   
   <div class="choice">
   <div id="status-right" data-score="20"></div>
   <div id="status-wrong-1"></div>
   <div id="status-wrong-2"></div>
   </div>

7. On considère un répertoire dans l'état suivant
   
   <div id="rebase"></div>
   
   Quel sera le résultat de la commande `git pull --rebase` ?
   
   <div class="choice">
   <div id="rebase-wrong-1"></div>
   <div id="rebase-wrong-2"></div>
   <div id="rebase-right" data-score="20"></div>
   </div>

Bravo ! Votre score est de : **<span class="score">0</span> points !**


<script src="../../assets/tutorial5-d3.js"></script>
