# 💌 S7J1 - Action Mailer & EventFreeka Backend

## 📖 Résumé du cours
Cette journée a marqué le début du projet **EventFreeka**, un clone d'Eventbrite. L'objectif était de poser des fondations back-end solides et d'automatiser la communication utilisateur :
1. **Architecture Relationnelle** : Création des modèles `User`, `Event` et `Attendance` (table de jointure).
2. **Action Mailer** : Configuration de l'outil de gestion des e-mails de Rails, fonctionnant sur un modèle MVC (Mailer -> View).
3. **Automatisation par Callbacks** : Utilisation de `after_create` dans les modèles pour déclencher l'envoi d'e-mails sans encombrer les contrôleurs.
4. **Tests Locaux** : Mise en place de `letter_opener` pour prévisualiser les e-mails dans le navigateur sans serveur SMTP réel.

## 💡 Ce que j'ai compris
* **Le rôle des Callbacks** : Déplacer la logique d'envoi de mail dans le modèle (`after_create`) permet de respecter le principe "Fat Model, Skinny Controller".
* **Conventions de nommage** : Rails cherche des templates basés sur le nom de la méthode du mailer (ex: `welcome_email.html.erb`).
* **L'importance du format double** : Il est crucial de fournir une version `.html.erb` et `.text.erb` pour garantir la lisibilité sur tous les clients mails.

## 🛠️ Installation et Prise en main
1. Cloner le repo.
2. `bundle install`.
3. `rails db:create db:migrate db:seed`.
4. Lancer `rails c` pour tester les triggers de mail.
