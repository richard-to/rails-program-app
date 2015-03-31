# Rails Program App

This is a sample Rails program to practice RSpec and TDD.

## Usage notes

When running rails server through Vagrant, you bind to `0.0.0.0` so it can be viewed outside the VM.

## Rails console commands used

First navigate to shared directory in vagrant

- vagrant ssh
- cd /vagrant

Create Rails app

- rails new rails-program-app

Install some Gems: rpsec-rails, less-rails, twitter-bootstrap-rails, therubyracer, local_time

- bundle install

Create scaffold for program model and migrate

- rails g scaffold Program title:string subtitle:string code:string
- rake db:migrate

Generate rspec boilerplate and run initial set of scaffold tests

- rails generate rspec:install
- rake spec

Generate bootstrap based themes for scaffold views

- rails generate bootstrap:install less
- rails generate bootstrap:install --no-coffeescript
- rails g bootstrap:themed Program

Create language model as bonus feature

- rails g model Language name:string
- rake db:migrate
- rake db:seed
- rails g migration AddLanguageIdToPrograms language:references
- rake db:migrate