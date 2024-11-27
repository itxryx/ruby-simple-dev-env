FROM ruby:3.3.6-bookworm

WORKDIR /ruby-simple-dev-env
RUN apt update -qq &&  \
    apt install -y build-essential
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
