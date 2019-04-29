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
* Start puma server by `rails s`.

## Testing

* `bundle exec rspec`
