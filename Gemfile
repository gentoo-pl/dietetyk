#
#
#

ruby "2.5.0"

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

# Puma jako serwer
gem 'puma', '~> 3.7'
# Wykorzystaj SCSS dla styli
gem 'sass-rails', '~> 5.0'

# wykorzystaj Uglifier jako kompresor plików JS
gem 'uglifier', '>= 1.3.0'


# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '~> 4.2'
#gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development do
  # obsługa developerskiej baza danych
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # Na produkcji (heroku) musimy użyć postgresql
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'

gem 'bootstrap-datepicker-rails'
gem 'owlcarousel-rails'
gem 'jquery-validation-rails'
gem 'magnific-popup-rails', '~> 1.1.0'

# powiększanie zdjęć
gem 'fancybox-rails'

# framework css i js w backendzie
gem 'foundation-rails'

# ładny opis struktury bazy danych w modelu
gem 'annotate'

# ładne ikonki
gem "font-awesome-rails"
# gem 'foreman'
