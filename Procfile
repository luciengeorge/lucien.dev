web: bundle exec puma -C config/puma.rb
worker: bundle exec rake solid_queue:start
release: rake db:migrate db:solid_queue:install:migrations db:migrate
