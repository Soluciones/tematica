source "https://rubygems.org"

# Declare your gem's dependencies in news_tematica.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.
gem 'inherited_resources'

gem 'jquery-rails'

group :development, :test do
  gem 'pg'
  gem 'ffaker'
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'binding_of_caller'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec-rails', '~> 3.0'
  gem 'launchy'
  gem 'temping'
end
