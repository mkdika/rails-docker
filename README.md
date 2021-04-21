# Rails Docker

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

Serving & provision the development dependencies of Ruby on Rails project with Docker.

## Requirement

1. [Install Docker](https://docs.docker.com/engine/install/), for your related OS.
2. [Install Docker Compose](https://docs.docker.com/compose/install/), incase it does not install along with Docker.

## Stack

1. __PostgreSQL__, version: `12`, docker-image: [postgres:12-alpine](https://hub.docker.com/_/postgres)

2. __Redis__, version: `6.2`, docker-image: [redis:6.2-alpine](https://hub.docker.com/_/redis)

3. __Ruby__, version: `3.0.1`, docker-image: [ruby:3.0.1](https://hub.docker.com/_/ruby)

## Running

- Run Rails web apps

  ```bash
  docker-compose up
  ```

  Access rails project from url: [http://localhost:3000](http://localhost:3000)

## Copyright and License

Copyright 2021 Maikel Chandika (mkdika@gmail.com). Code released under the MIT License. See [LICENSE](/LICENSE) file.
