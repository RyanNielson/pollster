# README

A work-in-progress simple anonymous polling application built with Ruby on Rails and Hotwire

## Running locally

1. Install Ruby 3.1.2 manually or run `asdf install` in the project directory if you use `asdf` as a language version manager.
2. Install [Overmind](https://github.com/DarthSim/overmind#installation)
3. Run `bin/dev` to start Postgres and Redis via Docker Compose, along with the Rails app itself.
4. Open another terminal window and run `bin/rails db:migrate` to set up the database and run migrations.
5. In your browser visit http://localhost:3000 to use the app.