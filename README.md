WIP; Need to do a lot more stuff, but this is as far as I got with the time I had…

Trying to get a decent `docker` setup for some php dev.

# Quick start:

_once docker is installed_

create a `.env` file using `dot.env` as a template

  - `dev/up`
  - http://localhost/
    - *note: takes a few for the mysql container to startup - may see PDO error
    - *note: self-signed [snake-oil](https://en.wikipedia.org/wiki/Snake_oil_(cryptography)) cert
  - `dev/down` when done
  - `dev/clean` to reset (e.g. if you make a change to a Dockerfile)


## Handy commands

- `dev/shell` root bash shell in php container
- `dev/mysql` mysql command as root in mysql container
- `dev/mysqldump` will dump mysql db (for updating `docker/mysql/default_schema.sql`)


# PHP

To install a composer dependency:

`dev/composer require google/apiclient`


# TODO

- TODO: better readme
- TODO: bootstrap script to check dependencies
- TODO: self signed ssl cert for nginx
- TODO: informational output after `dev/up` is run (e.g. echo link+port)
- TODO: better base php image with more common/useful extensions (+memcache container?)
