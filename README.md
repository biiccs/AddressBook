# README

Things you may want to cover:

## Using docker
In source directory run following commands:

    docker-compose up

After while run following (when mysql up and running):

    docker-compose exec app bin/rails db:migrate RAILS_ENV=development

Navigate in browser http://0.0.0.0:3000;

## Without docker
* Ruby version 2.5.0
* System dependencies
    
    build-essential libpq-dev nodejs mysql-server mysql-client imagemagick
   
* Configuration

* Database creation

    Change database configuration in: ./config/database.yml
* Database initialization
    
    bin/rails db:migrate RAILS_ENV=development
