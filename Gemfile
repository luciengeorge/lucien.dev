source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

# Core Rails
gem 'rails', '~> 7.2.0'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.3.1'
gem 'bootsnap', '>= 1.4.4', require: false

# Modern asset handling
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'sprockets-rails'

# Essential for existing functionality
gem 'devise'
gem 'pundit', '~> 2.1'
gem 'pagy', '~> 3.5'
gem 'octokit', '~> 4.20'
gem 'faraday-http-cache'
gem 'faraday-retry'

# Form handling
gem 'simple_form'
gem 'simple_form-tailwind'

# Additional gems actually used
gem 'jbuilder', '~> 2.7'
gem 'view_component'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
end

group :test do
  gem 'capybara', '>= 3.26'
end
