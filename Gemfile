source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.0.4'
gem 'gravtastic'
gem 'font-awesome-rails'
gem 'rails', '~> 7.0.2', '>= 7.0.2.4'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'where_exists'
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'shoulda-matchers'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
