# Requirements

* Ruby 3.2.2
* Docker
* Docker-Compose

# Boot up

Start the project by running:
```
docker compose up -d --build
docker compose run -it app bin/rails db:create db:migrate db:seed
```
It will build the app image and setup a postgres instance for it

or

```
cp .env.example .env
(fill in the DB variables for your setup on .env)
bundle exec rails db:create db:migrate db:seed
bundle exec rails s
```
