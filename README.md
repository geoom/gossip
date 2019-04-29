# gossip

[![Build Status](https://travis-ci.org/geoom/gossip.svg?branch=master)](https://travis-ci.org/geoom/gossip)
[![Maintainability](https://api.codeclimate.com/v1/badges/cf236bf7e4dc0a96cb62/maintainability)](https://codeclimate.com/github/geoom/gossip/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/cf236bf7e4dc0a96cb62/test_coverage)](https://codeclimate.com/github/geoom/gossip/test_coverage)

A medium-like webapp with restful Rails-based API & React/Redux client.

* Conceptually inspired by medium app.
* Rest Api design guided by [Github guidelines](https://developer.github.com/v3/).
* Code style bounded by [@rubocop-hq](https://github.com/rubocop-hq/ruby-style-guide) and [@airbnb](https://github.com/airbnb/javascript/tree/master/react)

## Features

* Users can manage articles.
* Users can follow another users.
* Users can view users' board.
* Users can search for articles.

## Arquitecture design

This will be the first aproximation regarding high availability archtecture

![Imgur](https://i.imgur.com/7DAvTLJ.png)

You can read more about it in [design topic](https://github.com/geoom/gossip/blob/master/design.md).

## Installing & Operation instrucctions

All technical files is under [`api`(as server)](https://github.com/geoom/gossip/tree/master/api) and [`web`(as client)](https://github.com/geoom/gossip/tree/master/web) folder.

