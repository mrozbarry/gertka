source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem "slim-rails"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  gem 'bootstrap-sass'
  gem 'font-awesome-sass-rails'
end

gem 'jquery-rails'

gem 'simple_form'

gem "rspec-rails", ">= 2.11.4", :group => [:development, :test]
gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]

group :development do
  gem 'awesome_print'
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem "quiet_assets", ">= 1.0.1"
end

group :test do
  gem "capybara", "~> 1.1.3"
  # gem 'poltergeist'
  # gem 'capybara-email'
  gem "database_cleaner", ">= 0.8.0"

  gem 'faker'
  gem 'mocha', require: 'mocha/api'

  # gem 'brakeman'

  gem 'guard-rspec'
  # gem 'guard-brakeman'
  gem 'guard-livereload'
  gem 'rb-fsevent', '~> 0.9.1',  require: false
end