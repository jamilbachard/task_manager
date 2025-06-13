# Task Manager

Une application de gestion de tâches moderne et intuitive, construite avec Ruby on Rails et Tailwind CSS.

## Fonctionnalités

- Création et gestion de listes de tâches
- Ajout, modification et suppression de tâches
- Marquage des tâches comme complétées
- Filtrage des tâches (toutes, complétées, incomplètes)
- Interface utilisateur moderne et responsive avec Tailwind CSS
- Messages flash pour les notifications
- Pagination des listes
- URLs conviviales avec Friendly ID

## Prérequis

- Ruby 3.3.5
- PostgreSQL
- Rails 8.0.2
- Node.js (pour les assets)

## Installation

1. Clonez le dépôt :
```bash
git clone <repository-url>
cd task_manager
```

2. Installez les dépendances Ruby :
```bash
bundle install
```

3. Configurez la base de données :
```bash
rails db:create
rails db:migrate
rails db:seed  # Charge des données de démonstration
```

4. Démarrez le serveur de développement :
```bash
bin/dev
```

Cette commande démarre à la fois le serveur Rails et le processus de compilation des assets Tailwind CSS.

L'application sera accessible à l'adresse `http://localhost:3000`

> Note : Les seeds incluent des exemples de listes et de tâches pour vous aider à démarrer. Vous pouvez les modifier dans `db/seeds.rb` selon vos besoins.

## Développement

### Tests

L'application utilise RSpec pour les tests. Pour exécuter les tests :

```bash
rails test
```

### Linting

Le code est vérifié avec RuboCop pour maintenir un style cohérent :

```bash
rubocop
```

### Sécurité

Des analyses de sécurité sont effectuées avec Brakeman :

```bash
brakeman
```

## Déploiement

L'application est configurée pour être déployée avec Kamal. Consultez `config/deploy.yml` pour la configuration du déploiement.

## Technologies utilisées

- Ruby on Rails 8.0.2
- PostgreSQL
- Tailwind CSS
- Stimulus.js
- Turbo
- Friendly ID
- Draper
- Pagy
- Kamal pour le déploiement

## Licence

Ce projet est sous licence MIT.
