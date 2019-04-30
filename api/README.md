# Gossip API

This doc documents whatever steps are necessary to get the application up and running.

## Dependencies

* Ruby 2.4.x
* Rails 5.2.x
* Postgresql 9.6

## Installing

* Get gems executing `bundle install`.
* Reset credentials: `rm config/credentials.yml.enc && EDITOR=vim rails credentials:edit`
* let's initialize the database by `rails db:create`.
* Execute migrations: `rails db:migrate`.
* Populate tables using fixtures with `rails db:seed`
* Start puma server by `rails s`.

## Testing

* `bundle exec rspec`

## How to hit endpoints (this isn't api docs)

* `http :3000/auth/login email=myemail@email.com password=myaccess`
* `http :3000/signup email=whatever@email.com password=foobar password_confirmation=foobar`
* `http :3000/articles Accept:'application/vnd.gossip.v1+json' Authorization:'YOUR_AUTH_TOKEN_HERE'`
* `http POST :3000/articles title='Sequi ut in. Perferendis est null' content='Voluptatem voluptatibus occaecati' user_id=1 Authorization:'YOUR_AUTH_TOKEN_HERE'`
