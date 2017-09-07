FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /backlogg/backlogg-api-comments
WORKDIR /backlogg/backlogg-api-comments
COPY . ./
RUN gem install bundler --no-document
RUN bundle install
EXPOSE 3002
# ENTRYPOINT ["bundle", "exec"]
ENTRYPOINT ["./docker-entry.sh"]
CMD ["rails", "server", "-p", "3002", "-b", "0.0.0.0"]