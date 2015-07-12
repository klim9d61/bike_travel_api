# Bike Travel Api

An api on Rails for learning purpose

## Running Locally

Make sure you have Ruby installed.

```sh
$ git clone https://github.com/klim9d61/bike_travel_api.git
$ cd bike_travel_api
$ bundle install
$ bundle exec rake db:create db:migrate
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

## Documentation

For more information about using Ruby on Heroku, see these Dev Center articles:

- [Ruby on Heroku](https://devcenter.heroku.com/categories/ruby)

