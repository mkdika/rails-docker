FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update --fix-missing && apt-get install -y nodejs yarn
WORKDIR /rails-docker
COPY Gemfile /rails-docker/Gemfile
COPY Gemfile.lock /rails-docker/Gemfile.lock
COPY package.json /rails-docker/package.json
COPY yarn.lock /rails-docker/yarn.lock
RUN gem update --system && \
    gem install bundler:2.2.16 && \
    bundler install
COPY . /rails-docker
RUN yarn install && \
    yarn cache clean --all
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
