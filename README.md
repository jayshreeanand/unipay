# README

Unified payments app for fast business and personal payments. It lets you handle shopping, subscriptions and invoices with business and also your friends using a unique Unipay ID

# Tech Stack
- Rapyd checkout toolkit
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


### Screenshots
<img width="1311" alt="Screenshot 2022-05-30 at 11 49 49 PM" src="https://user-images.githubusercontent.com/5363211/171059332-b1f0bc69-7793-4597-9a8a-fed5739b80b7.png">

<img width="1636" alt="Screenshot 2022-05-31 at 2 12 07 AM" src="https://user-images.githubusercontent.com/5363211/171059341-5de64cb7-457d-4ec7-9d1e-7cecc097b4d0.png">

<img width="1547" alt="Screenshot 2022-05-31 at 2 12 14 AM" src="https://user-images.githubusercontent.com/5363211/171059363-c852b8c2-74bc-4afe-a154-f37b4f5a5599.png">

<img width="1512" alt="Screenshot 2022-05-31 at 2 12 23 AM" src="https://user-images.githubusercontent.com/5363211/171059369-1f15e42f-244c-4c56-8bdc-f001327b0ec3.png">


<img width="1184" alt="Screenshot 2022-05-31 at 2 12 32 AM" src="https://user-images.githubusercontent.com/5363211/171059382-cf7486a3-f294-4643-89b6-7125fbe79bba.png">

<img width="1069" alt="Screenshot 2022-05-31 at 2 12 42 AM" src="https://user-images.githubusercontent.com/5363211/171059394-d4308014-94bf-49ff-8138-3bb9c92f7db3.png">

<img width="1009" alt="Screenshot 2022-05-31 at 2 12 55 AM" src="https://user-images.githubusercontent.com/5363211/171059404-6ebd3e7b-a360-4e14-bde6-a46123070508.png">

<img width="789" alt="Screenshot 2022-05-31 at 2 13 16 AM" src="https://user-images.githubusercontent.com/5363211/171059413-3c8d705a-1ed7-4244-9486-6c406e26298c.png">

<img width="841" alt="Screenshot 2022-05-31 at 2 13 28 AM" src="https://user-images.githubusercontent.com/5363211/171059419-5a43d882-89c0-4802-b884-77007d425478.png">

<img width="1223" alt="Screenshot 2022-05-31 at 2 13 34 AM" src="https://user-images.githubusercontent.com/5363211/171059430-b158e3c8-0b11-4bc1-a77e-56639ef8d65d.png">
<img width="825" alt="Screenshot 2022-05-31 at 2 13 40 AM" src="https://user-images.githubusercontent.com/5363211/171059438-6e269211-5d43-402d-b5f9-e5d209c2679c.png">

<img width="822" alt="Screenshot 2022-05-31 at 2 13 45 AM" src="https://user-images.githubusercontent.com/5363211/171059456-b5bcc634-6107-4c0f-b008-c7a556cc7e05.png">



