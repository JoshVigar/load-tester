# Dockerfile.rails
FROM ruby:3.1.2

ARG APP_PORT
ENV PORT $APP_PORT

ENV PATH $APP_ROOT/bin:$PATH

ENV RAILS_ENV production

COPY Gemfile Gemfile.lock $APP_ROOT/

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    libmariadb-dev \
  && bundle config set without 'development test' \
  && bundle install \
  && apt-get purge -y --auto-remove build-essential \
  && rm -rf /var/lib/apt/lists/*

COPY . $APP_ROOT/

EXPOSE $APP_PORT

ENTRYPOINT ["docker-entrypoint"]

CMD ["puma", "-C", "config/puma.rb"]
