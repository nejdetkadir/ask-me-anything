# ask me anything
  It is a clone application of [ask.fm](https://ask.fm/), created with Ruby on Rails.

* Ruby version
  ```
  ruby 3.0.0
  ```

* Rails version
  ```
  Rails 6.1.3.1
  ```

# Installation

## Prerequisites
- [Ruby](https://rvm.io/)
- [NodeJS (>=10.x)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- ImageMagick `sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev`
- [Yarn](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
- [PostgreSQL](https://www.postgresql.org/download/)


## Installation

- Install GEM dependencies:

  ```bash
  bundle install
  ```

- Install asset dependencies:

  ```bash
  yarn install
  ```

- Create database, migrate tables and run the seed data:

  ```bash
  rails db:create
  rails db:migrate
  rails db:seed
  ```

- If you are setting up again, when you already have previous databases:

  ```bash
  rails db:reset
  ```
- For dropping database
  ```bash
  rails db:drop
  ```

- Create environment variables for omniauth providers, Create a file named "config/application.yml" and fill its contents as follows
  
  ```yml
  OA_GOOGLE_CLIENT_ID: 'XXX'
  OA_GOOGLE_SECRET_KEY: 'XXX'
  OA_GITHUB_CLIENT_ID: 'XXX'
  OA_GITHUB_SECRET_KEY: 'XXX'
  ```
