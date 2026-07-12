# Kirby Soft and Wet
## Analyse du jeu et de ses mécaniques

> Document descriptif pour l'équipe — objectif : comprendre le jeu original afin de le cloner et d'implémenter ce qui nous plaît.

---

## 2. Vision et positionnement

### 2.1. Pitch (une phrase)

Kirby Soft and Wet est un jeu de pêche où l'on réalise des QTE pour attraper puis collectionner des poissons (et bien plus encore!).

### 2.2. Résumé exécutif

Kirby Soft and Wet est un fangame de pêche en 2D vue de côté, situé dans l'univers de Kirby. Son esthétique pixel-art rappelle la Game Boy Advance et reste fidèle à la direction artistique globale de la licence : très colorée, enfantine et aux contrastes marqués.

La boucle principale se présente ainsi : le joueur lance la ligne avec la touche d'action, attend qu'un poisson morde à l'hameçon, puis doit enchaîner un QTE chronométré pour remonter la prise. Si toutes les actions sont réussies sans erreur, la capture est révélée — poisson, objet ou surprise crossover ; chaque entrée possède un niveau de rareté, et les prises les plus rares imposent des QTE plus exigeants. Lors d'une première capture, une fenêtre met en valeur la découverte ; la prise est ensuite consignée dans le **Fishbook**, qui suit la progression de la collection. Une fois validée, le joueur peut relancer la boucle. En cas d'échec au QTE, la capture est perdue et le catch combo retombe à 0.

Kirby Soft and Wet se distingue par la simplicité de sa boucle principale, sur laquelle viennent s'imbriquer des mécaniques secondaires (difficulté des QTE selon la rareté, combos de captures, économie, collection via le Fishbook, contenu selon l'heure réelle, prises crossover). Le jeu se démarque aussi par une interface claire et efficace, ainsi que par des feedbacks (visuels, sonores et UI) particulièrement lisibles et satisfaisants.

Kirby Soft and Wet sert de base à notre projet, car il repose efficacement sur une boucle de gameplay unique, facile à comprendre. Cette base nous permet d'envisager aisément des incrémentations mécaniques pour enrichir et orienter la direction du projet. Le jeu étant mécaniquement simple, son clonage nous apparaît accessible et nous évite une simulation physique de pêche (densité de l'eau, flottabilité…), au profit d'une approche centrée sur les QTE, le feedback et la progression.

### 2.3. Public cible

- La communauté des **fangames** — joueurs qui cherchent et partagent des créations fan
- Les **nostalgiques de l'esthétique Game Boy Advance** — pixel art, palette limitée, feel rétro
- Les **fans de la licence Kirby** — attirés par l'univers et les personnages

### 2.4. Plateforme(s) cible(s)

- PC et navigateur via itch.io

### 2.5. Genre et sous-genre

**Genre principal :** jeu casual 2D

**Sous-genres / composantes :**

- mini-jeu de pêche
- arcade (séquences QTE)
- collection

### 2.6. Références et inspirations

<!-- À compléter -->

### 2.7. Proposition de valeur — pourquoi ce jeu ?

**Pour le joueur :**
- Entrée immédiate, boucle compréhensible en 30 s
- QTE satisfaisants + feedbacks lisibles
- Rejouabilité via combo, collection, raretés, surprises (dont objets et crossovers), prises selon l'heure du jour

**Pour nous (référence de clone) :**
- Mécaniquement simple, pas de physique
- Boucle unique extensible par petites itérations

### 2.8. Piliers de design

- **Simplicité** — à la fois mécanique et visuelle ; aucun tutoriel n'est nécessaire pour comprendre la boucle de gameplay, le jeu montre d'emblée ce qu'il propose
- **Feedback fort et juicy** — les interactions sont impactantes et renforcées par de nombreux effets juicy
- **Core loop centrale** — la core loop est le jeu ; tout ce qui vise à enrichir l'expérience de jeu est incrémenté sur cette boucle (combo, découverte, économie, progression, contenu horaire)
- **Accessible** — le jeu se prête particulièrement aux sessions courtes et offre une bonne rejouabilité tant que la collection n'est pas remplie ; l'heure réelle incite à revenir à différents moments de la journée
---

## 3. Expérience joueur

### 3.1. Fantasy du joueur

**Début de partie — compétence immédiate**
- Grâce à l'accessibilité, le joueur se sent pleinement capable d'attraper (presque) tout

**En session — tension maîtrisée**
- En enchaînant les QTE, une tension monte via le catch combo ; il reste concentré pour faire grimper le compteur
- Les prises rares demandent des QTE plus difficiles : la concentration devient un enjeu réel
- Rater un QTE fait perdre la capture et briser le combo — chaque enchaînement compte

**Progression — contrôle et pouvoir**
- La boutique renforce la sensation de contrôle sur l'expérience : **appâts** et **flotteurs** influencent le gameplay, **chapeaux** et **spray paints** servent la personnalisation cosmétique

**Collection — curiosité récompensée**
- Chaque nouvelle prise stimule par la découverte (première capture, rareté, surprise)
- Au-delà des poissons, le jeu propose objets et **crossovers** (sprites, références à d'autres jeux) : la collection mélange fan service et curiosité
- Certaines prises ne sont disponibles qu'à certaines heures : le joueur est incité à revenir à des moments différents pour compléter sa collection

**Maîtrise avancée — chasse aux shiny**
- À combo élevé, accès aux versions shiny : le joueur se sent récompensé pour sa régularité et son engagement

### 3.2. Objectifs du joueur

**Court terme**
- Réussir la séquence QTE et remonter la prise — sans erreur sur les captures rares
- Enchaîner les captures pour faire monter le catch combo, sans le briser

**Moyen terme**
- Compléter le **Fishbook** (nouvelles entrées, suivi de la collection)
- Accumuler de la monnaie : acheter appâts et flotteurs (gameplay), chapeaux et spray paints (cosmétique)
- Attraper des espèces disponibles uniquement à certaines heures de la journée

**Long terme**
- Compléter la collection (poissons, objets, crossovers, variantes)
- Obtenir les versions shiny (via combo élevé)
- Découvrir l'ensemble du contenu lié au temps réel (prises selon l'heure)

### 3.3. Courbe d'expérience visée

- **Apprentissage très court** : la boucle de jeu est comprise en quelques essais ; le joueur sait vite comment lancer, attendre, puis réussir un QTE.
- **Difficulté globalement stable** : en dehors de quelques prises plus exigeantes, la difficulté ne monte pas vraiment avec le temps ; le jeu privilégie la maîtrise confortable plutôt que le challenge croissant.
- **Progression par élargissement des objectifs** : au fil des sessions, le joueur passe de « réussir ses QTE » à « remplir le Fishbook », puis « optimiser son combo », « chercher des prises horaires » et « chasser les shiny ».
- **Engagement lié à la collection et aux découvertes** : la courbe vise à garder la même accessibilité mécanique tout en donnant de plus en plus de raisons de revenir.

### 3.4. Durée de session typique

Le jeu s'adapte à différents rythmes de session :

- **Micro-sessions** : l’entrée dans la boucle est immédiate ; le joueur peut s’arrêter après quelques captures.
- **Sessions “chasse”** : une fois lancé, le joueur maintient son catch combo pour maximiser les chances de shiny, ce qui prolonge naturellement la session.

### 3.5. Ton et ambiance

- **Ton** : jovial et léger.
- **Ambiance** : détente, relaxation (cozy).
- **Sources d'identité** : le fangame s'appuie sur la direction artistique et la vibe naturelle des jeux Kirby, tout en résonnant avec des thèmes musicaux proches de licences comme Paper Mario ou Pikmin.
- **Visuel** : très coloré, arrondi et enfantin, avec des palettes chaudes et contrastées qui renforcent le côté reposant.

---

## 4. Boucle de gameplay principale (Core Loop)

### 4.1. Description de la boucle en une phrase

Le joueur lance la ligne, attend qu’un poisson morde, puis enchaîne une séquence QTE pour remonter la prise : en cas de succès, la capture est révélée (poisson/objet/crossover), le catch combo progresse et le Fishbook se met à jour avec une mise en avant si c’est une première découverte ; puis le joueur peut relancer la boucle. En cas d’échec au QTE, la capture est perdue et le catch combo retombe à 0 avant de pouvoir recommencer.

### 4.2. Schéma de la boucle

- Lancer la ligne (touche d’action — distance visuelle aléatoire, sans impact gameplay)
- Attendre la morsure d'une prise potentielle
- Morsure : apparition de la jauge QTE et du premier bouton directionnel au centre de l'écran
- Exécuter la séquence QTE chronométrée
- Si succès :
  - Révélation de la prise (poisson, objet ou surprise crossover)
  - Mise à jour du catch combo + feedbacks “juicy”
  - Première capture : fenêtre de découverte
  - Inscription / suivi dans le Fishbook
  - Relance immédiate de la boucle
- Si échec :
  - Capture perdue
  - Catch combo retombé à 0
  - Retour à une nouvelle tentative

### 4.3. Entrées du joueur

- Touche d’action : lancer la ligne (seul input — pas de visée ; la distance d'atterrissage est aléatoire et purement visuelle)
- Entrées QTE : directions / flèches correspondant à la séquence à exécuter
- (Optionnel entre deux prises) navigation UI pour consulter Fishbook / menus

### 4.4. Feedback et récompenses immédiates

**Lancer la ligne**
- **Feedback** : animation du lancer ; distance d'atterrissage aléatoire (variété visuelle, sans impact gameplay)
- **Récompense** : —

**Attente / morsure**
- **Feedback** : pas de son dédié à la morsure ; apparition au centre de l'écran de la jauge QTE et du premier bouton directionnel ; le son déclenché est celui du bouton QTE
- **Récompense** : —

**QTE en cours**
- **Feedback** : validation par input réussi, effets juicy sur les bonnes directions (petites étoiles autour de l'input réussie)
- **Récompense** : —

**QTE réussi**
- **Feedback** : feedback de succès marqué, révélation de la prise
- **Récompense** : capture obtenue, quelques pièces (montant selon la rareté de la prise)

**QTE raté**
- **Feedback** : feedback d'échec lisible
- **Récompense** : capture perdue, catch combo retombé à 0

**Capture (toute prise)**
- **Feedback** : présentation de l'objet attrapé, indication de rareté
- **Récompense** : progression du catch combo (+1)

**Première capture**
- **Feedback** : fenêtre de découverte mise en avant
- **Récompense** : nouvelle entrée dans le Fishbook

**Variante shiny**
- **Feedback** : **À COMPLÉTER** — en souvenir : fond de la case du sprite d'une couleur différente
- **Récompense** : version rare de la prise

**Principes généraux**

- Les feedbacks restent **lisibles et satisfaisants** à chaque étape : le joueur comprend toujours s'il a réussi, raté, ou découvert quelque chose de nouveau.
- Les effets **juicy** (VFX, sons, UI) renforcent l'impact des interactions sans sortir de la DA colorée et enfantine du jeu.
- Les récompenses immédiates de la boucle sont surtout **la capture elle-même**, la **monnaie** (selon rareté, pas selon le combo), la **montée du combo catch** et, ponctuellement, une **nouvelle entrée Fishbook** ou une **prise shiny**.

### 4.5. Friction et échec dans la boucle

**Échec au QTE — prise ratée**
- Friction principale : rater la séquence QTE fait perdre la capture en cours
- Conséquence immédiate : pas de récompense (pas de pièces, pas d'entrée Fishbook pour cette tentative)
- Le joueur peut relancer la boucle tout de suite — pas de punition lourde ni d'écran de game over

**Combo catch brisé**
- Seconde friction : en cas d'échec, le catch combo retombe à **0**
- Perte d'un enjeu accumulé pendant la session (d'autant plus frustrant si le joueur visait un long enchaînement ou une chasse aux shiny)
- Incite à rester concentré sur chaque QTE, surtout sur les prises rares

**Caractère général**
- Les frictions restent **légères et intégrées à la boucle** : échec ponctuel, retour rapide à l'action
- La tension vient surtout de ne pas vouloir **perdre une prise** ni **casser son combo**, plutôt que d'une montée de difficulté globale

### 4.6. Ce qui pousse le joueur à relancer la boucle

- **Rapidité de la boucle** : quelques secondes entre deux tentatives, pas de temps mort
- **Satisfaction du QTE réussi** : feedbacks juicy qui donnent envie d'enchaîner
- **Catch combo en cours** : maintenir ou faire grimper le compteur (enjeu renforcé pour la chasse aux shiny)
- **Curiosité de la prochaine prise** : poisson, objet, crossover ou variante shiny possible
- **Découverte** : chaque première capture ouvre la fenêtre de découverte et nourrit l'envie d'en trouver d'autres
- **Récompense immédiate** : quelques pièces à chaque capture réussie
- **Échec peu bloquant** : après un raté, retour immédiat à l'action sans punition lourde

---

## 5. Boucles secondaires et méta-jeu

### 5.1. Boucles de progression

<!-- À compléter -->

### 5.2. Boucles de collection / complétion

<!-- À compléter -->

### 5.3. Boucles sociales ou compétitives

<!-- À compléter -->

### 5.4. Liens entre boucles

<!-- À compléter -->

---

## 6. Mécaniques de jeu

### 6.1. Liste des systèmes principaux

<!-- À compléter -->

### 6.2. Détail des systèmes

<!-- À compléter -->

### 6.3. Interactions entre systèmes

<!-- À compléter -->

---

## 7. Progression et équilibrage

### 7.1. Courbe de difficulté

<!-- À compléter -->

### 7.2. Système de progression du joueur

<!-- À compléter -->

### 7.3. Économie du jeu

<!-- À compléter -->

### 7.4. Récompenses et punitions

<!-- À compléter -->

### 7.5. Pacing

<!-- À compléter -->

### 7.6. Paramètres d'équilibrage clés

<!-- À compléter -->

---

## 8. Contenu

### 8.1. Inventaire du contenu prévu

<!-- À compléter -->

### 8.2. Ennemis / obstacles

<!-- À compléter -->

### 8.3. Objets, collectibles, équipements

<!-- À compléter -->

### 8.4. Niveaux, zones ou arènes

<!-- À compléter -->

### 8.5. Événements, quêtes ou missions

<!-- À compléter -->

### 8.6. Tableau de contenu

<!-- À compléter -->

---

## 9. Narration et monde

### 9.1. Synopsis

<!-- À compléter -->

### 9.2. Univers et lore

<!-- À compléter -->

### 9.3. Personnages principaux

<!-- À compléter -->

### 9.4. Structure narrative

<!-- À compléter -->

### 9.5. Intégration narrative / gameplay

<!-- À compléter -->

---

## 10. Interface et expérience utilisateur (UX / UI)

### 10.1. Architecture des écrans

<!-- À compléter -->

### 10.2. HUD en jeu

<!-- À compléter -->

### 10.3. Menus principaux et secondaires

<!-- À compléter -->

### 10.4. Onboarding et tutoriel

<!-- À compléter -->

### 10.5. Accessibilité

<!-- À compléter -->

### 10.6. Wireframes ou maquettes

<!-- À compléter -->

---

## 11. Direction artistique et audio

### 11.1. Style visuel

<!-- À compléter -->

### 11.2. Palette et identité graphique

<!-- À compléter -->

### 11.3. Animation et VFX

<!-- À compléter -->

### 11.4. Direction audio

<!-- À compléter -->

### 11.5. Assets nécessaires

<!-- À compléter -->

---

## 12. Contrôles et feel

### 12.1. Schéma de contrôles par plateforme

<!-- À compléter -->

### 12.2. Réactivité et game feel

<!-- À compléter -->

### 12.3. Caméra

<!-- À compléter -->

### 12.4. Retours haptiques

<!-- À compléter -->

---

## 13. Technique et contraintes

### 13.1. Moteur et outils

<!-- À compléter -->

### 13.2. Plateformes et exigences minimales

<!-- À compléter -->

### 13.3. Contraintes techniques identifiées

<!-- À compléter -->

### 13.4. Dépendances et intégrations externes

<!-- À compléter -->

### 13.5. Risques techniques

<!-- À compléter -->

---

## 14. Scope et planification

### 14.1. MVP — contenu minimum viable

<!-- À compléter -->

### 14.2. Fonctionnalités prévues

<!-- À compléter -->

### 14.3. Backlog / hors scope

<!-- À compléter -->

### 14.4. Jalons et phases de production

<!-- À compléter -->

### 14.5. Répartition des rôles dans l'équipe

<!-- À compléter -->

---

## 15. Métriques et critères de succès

### 15.1. Critères de réussite du design

<!-- À compléter -->

### 15.2. Métriques de gameplay à suivre

<!-- À compléter -->

### 15.3. Critères de fin de production

<!-- À compléter -->

---

## 16. Questions ouvertes et décisions en attente

### 16.1. Décisions non tranchées

<!-- À compléter -->

### 16.2. Hypothèses à valider

<!-- À compléter -->

### 16.3. Risques design

<!-- À compléter -->

---

## Annexes

- A. Glossaire des termes du projet
- B. User stories ou cas d'usage joueur
- C. Prototypes et liens de démo
- D. Documents connexes
