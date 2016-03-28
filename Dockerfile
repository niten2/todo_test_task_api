FROM ruby:2.2.1

RUN apt-get update && apt-get install -y \
            build-essential \
            nodejs

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./
RUN cp config/database.docker.yml config/database.yml

EXPOSE 3000

