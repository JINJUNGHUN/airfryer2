source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.2'
gem "sqlite3", "~> 1.3.6", :group => :development
gem 'pg', '~> 0.21', :group => :production
gem 'rails_12factor', :group => :production

gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'nested_form_fields'
gem 'fog', '~> 2.1'
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'rmagick', '~> 2.16'
gem 'file_validators'
gem 'impressionist'
gem 'devise', git: 'https://github.com/plataformatec/devise.git'
gem 'devise-i18n'
gem 'figaro'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'paranoia'
gem 'cancancan'
gem 'rolify'
gem 'simple_form', '~> 4.1'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'rails_db'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
