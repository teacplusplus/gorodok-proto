source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem "therubyracer"
gem "simple_form"
gem "devise"
gem "cancan"
gem "responders"
gem "rspec-rails", :group => [:test, :development]
gem "factory_girl_rails", :group => :test
gem "capybara", :group => :test
gem "capybara-webkit", :group => :test
gem "database_cleaner", :group => :test
gem "guard", :group => :test
gem "spork", :group => :test
gem "guard-spork", :group => :test
gem "guard-rspec", :group => :test
group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", :require => "sqlite3"
end
gem "geocoder"
gem "will_paginate" ,'~>3.0'
gem "gmaps4rails"
gem "rmagick"
gem "recaptcha"