# Task Manager

A modern and intuitive task management application, built with Ruby on Rails and Tailwind CSS.

## Features

- Create and manage task lists
- Add, modify and delete tasks
- Mark tasks as completed
- Filter tasks (all, completed, incomplete)
- Modern and responsive user interface with Tailwind CSS
- Flash messages for notifications
- List pagination
- User-friendly URLs with Friendly ID

## Prerequisites

- Ruby 3.3.5
- PostgreSQL
- Rails 8.0.2
<!-- - Node.js (for assets) -->

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd task_manager
```

2. Install Ruby dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:create
rails db:migrate
rails db:seed  # Loads demo data
```

4. Start the development server:
```bash
bin/dev
```

This command starts both the Rails server and the Tailwind CSS asset compilation process.

The application will be available at `http://localhost:3000`

> Note: The seeds include example lists and tasks to help you get started. You can modify them in `db/seeds.rb` according to your needs.

<!-- ## Development

### Tests

The application uses RSpec for testing. To run the tests:

```bash
rails test
```

### Linting

Code is checked with RuboCop to maintain consistent style:

```bash
rubocop
```

### Security

Security scans are performed with Brakeman:

```bash
brakeman
``` -->

## Deployment

The application is configured to be deployed with Kamal. See `config/deploy.yml` for deployment configuration.

## Technologies used

- Ruby on Rails 8.0.2
- PostgreSQL
- Tailwind CSS
- Stimulus.js
- Turbo
- Friendly ID
- Draper
- Pagy
- Kamal for deployment

## License

This project is under MIT license.
