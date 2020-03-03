FROM ruby:2.5.7-alpine
LABEL maintainer="Mike Bell <mike.bell@weareconvivio.com>"

# Install packages
RUN apk add --no-cache bash build-base curl nodejs wget git

# Upgrade bundler
RUN gem install bundler -v '~> 1.13' --no-document && \
  gem cleanup

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Install the bundle
RUN GEM_PATH="${GEM_HOME}" bundle install

# Mounts
WORKDIR /src

# Expose ports
EXPOSE 4567
EXPOSE 35729

ADD ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bundle", "exec", "middleman", "server"]