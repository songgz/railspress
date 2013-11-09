source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '2.2.1'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Create dummy date
gem 'faker', '1.1.2'

# Pagination
gem 'will_paginate', '3.0.5'
gem 'will_paginate-bootstrap', '0.2.5'

# Uploading images
gem 'carrierwave'
gem 'fog', '~> 1.3.1'

# You need ImageMagick before rmagick
gem 'rmagick'

# Setting the content type
gem 'mime-types'

# Full text search
gem 'pg_search'

# Use unicorn as the app server
# gem 'unicorn'

# Tagging
gem 'acts-as-taggable-on'

# Syntax hilighting
gem 'rouge'

# Markdown
gem 'redcarpet'

# URL with slug
gem 'friendly_id'

group :production do
  # For heroku
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  # to shorten the time for RSpec
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'childprocess', '0.3.6'
end

group :development do
  gem 'debugger'
  # For chrome inspecter panel
  gem 'meta_request'
  # Use 'binding pry' at any line
  gem 'pry', '0.9.10'
  gem 'better_errors' # Not working
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'factory_girl_rails', '4.2.1'
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'headless'
end

# For specify version in heroku
ruby "2.0.0"
