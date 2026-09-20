# Boucle de pêche — Document de travail

## Vue d'ensemble

La boucle de pêche est la mécanique centrale du jeu.
Elle se joue en continu sur la scène principale (world / fishing spot).
Elle passe par 6 phases distinctes, de l'attente du joueur jusqu'au résultat de la prise.

---

## Les phases

### 1. IDLE — Attente
- **Description :** État de base. Arkaking est au bord de l'eau, canne en main, en attente.
- **Entrée :** Lancement du jeu, fin d'un WIN ou d'un LOSE.
- **Ce qui se passe ici :** Rien — le joueur peut prendre son temps.
- **Animation :** IDLE en boucle.
- **Sortie :** Le joueur appuie sur le bouton de lancer → passe à THROWING.

---

### 2. THROWING — Lancer
- **Description :** Arkaking lance sa canne à pêche. Phase courte, non interruptible.
- **Entrée :** Input du joueur depuis IDLE.
- **Ce qui se passe ici :** L'animation de lancer se joue jusqu'au bout.
- **Animation :** LANCER.
- **Sortie :** Fin de l'animation → passe automatiquement à WAITING.

---

### 3. WAITING — Attente de morsure
- **Description :** Le flotteur est à l'eau. On attend qu'un poisson morde.
- **Entrée :** Fin de l'animation LANCER.
- **Ce qui se passe ici :** Un timer ou un événement aléatoire déclenche la morsure. Le joueur attend.
- **Animation :** IDLE (ou animation d'attente dédiée — à définir).
- **Sortie :** Morsure détectée → passe à QTE.
- **Note :** La durée d'attente et la logique de morsure sont à détailler (rareté du poisson, hasard, etc.).

---

### 4. QTE — Mini-jeu de prise
- **Description :** Un poisson a mordu. Le joueur doit entrer une séquence de directions correctement pour le capturer.
- **Entrée :** Déclenchement de la morsure depuis WAITING.
- **Ce qui se passe ici :**
  - Une séquence de directions aléatoires s'affiche (↑ → ← ↓).
  - Le nombre de phases (longueur de la séquence) dépend de la **rareté du poisson**.
  - La vitesse d'exécution est à définir (probablement liée à la rareté ou à la phase de jeu).
  - Le joueur doit reproduire la séquence dans le bon ordre.
- **Animation :** À définir (tension, effort ?).
- **Sortie :**
  - Séquence réussie → WIN.
  - Séquence ratée → LOSE.
- **Note :** Le détail du système de phases (rareté, vitesse, difficulté) est à préciser dans un second document.

---

### 5. WIN — Victoire
- **Description :** Le joueur a réussi la séquence QTE. Arkaking sort le poisson de l'eau.
- **Entrée :** Bonne séquence depuis QTE.
- **Ce qui se passe ici :**
  - Animation de victoire : Arkaking tire le poisson hors de l'eau (mouvement de bras).
  - Le **ComboChain** s'incrémente de +1.
  - (Effets du ComboChain à définir : bonus, score, modificateurs ?)
- **Animation :** Tir d'un coup — Arkaking ramène le poisson (animation intermédiaire dédiée).
- **Sortie :** Fin de l'animation → retour à IDLE.

---

### 6. LOSE — Échec
- **Description :** Le joueur a raté la séquence QTE. Le poisson s'échappe.
- **Entrée :** Mauvaise séquence depuis QTE.
- **Ce qui se passe ici :**
  - Animation d'échec.
  - Le **ComboChain** est remis à zéro (stop combochain).
- **Animation :** LOSE (à créer).
- **Sortie :** Fin de l'animation → retour à IDLE.

---

## Schéma des transitions

```
IDLE
 └─[input joueur]─→ THROWING
                      └─[fin anim]─→ WAITING
                                      └─[morsure]─→ QTE
                                                    ├─[séquence réussie]─→ WIN ─[fin anim]─→ IDLE
                                                    └─[séquence ratée]──→ LOSE ─[fin anim]─→ IDLE
```

---

## Points ouverts

| Sujet | Statut |
|-------|--------|
| Durée / logique de l'attente en WAITING | À définir |
| Système de rareté des poissons | À définir |
| Longueur et vitesse des séquences QTE | À définir |
| Effets du ComboChain | À définir |
| Animation WAITING | À créer (ou réutiliser IDLE ?) |
| Animation QTE / tension | À créer |
| Animation LOSE | À créer |
| Découpage par phase de jeu | Réflexion en cours — hors scope pour l'instant |
