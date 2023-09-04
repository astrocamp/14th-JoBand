# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.7.2'
gem 'sprockets-rails'

gem 'bootsnap', require: false
gem 'devise', '~> 4.9'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'
gem 'image_processing', '~> 1.2'
gem 'jbuilder'
gem "jsbundling-rails", "~> 1.1"
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem "paranoia", "~> 2.6"
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.3'
gem 'ransack', '~> 4.0'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem "aws-sdk-s3", require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'dotenv-rails'
  gem 'letter_opener', '~> 1.8'
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end