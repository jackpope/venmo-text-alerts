source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
ruby "2.2.0"
# Use postgres as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Devise for user authentication
gem 'devise'

# figaro for environmental variables
gem 'figaro'

# Twilio for texting
gem 'twilio-ruby'

# Whenever to run rake commands
gem 'whenever', require: false

group :development, :test do
  # Use pry for debugging
  gem 'pry'

  # Apparently i need this?
  gem 'web-console'
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Testing
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'

  # tell asset calls to shut up
  gem 'quiet_assets'

end

group :production do
  gem 'rails_12factor'
end

