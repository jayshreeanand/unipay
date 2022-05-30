# README

Rapyd Unipay application is built using Ruby on Rails and is hosted on heroku

# Tech Stack

- AWS EC2
- Docker
- Heroku
- Node.js
- Ruby on Rails
- QR code scanner / generator

## Installation

### First-Time Setup:

1. Copy and modify the database.yml file: `cp config/database.yml.example config/database.yml`
2. Copy and modify the .env file: `cp .env.example .env`
3. Run `bundle install` to install all the gems
4. Run `rake db:setup` to create and seed the database
5. Run `foreman start` to run the server
6. Add the following entry to your hosts file (`/etc/hosts`): `127.0.0.1 dev.unipay.com`
7. Now access the app at 'http://dev.unipay.com:3000'.

### Additional instructions for Test-Driven Development:

1. Run `rake db:test:load`
2. Run `guard` in another terminal to re-run the tests as and when files are modified

### Handling updates:

1. Run `bundle install`
2. Run `rake db:migrate`
