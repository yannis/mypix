source 'https://rubygems.org'
ruby "2.2.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'haml-rails', "~> 0.9"
gem 'bootstrap-sass', '~> 3.3.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Unicorn as the app server
gem 'unicorn'

gem "asset_sync"
gem "figaro"

gem "devise"
gem "cancancan"

gem "rmagick"
gem 'carrierwave', "0.10.0"
gem "fog"
gem "exifr"
gem "faker"
gem "airbrake"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "quiet_assets"

end

group :developement do
  gem "guard"
  gem "guard-rspec"
  gem "guard-bundler"
  gem "guard-livereload"
  # gem "guard-spring"
  gem "rspec-rails"
  gem "rspec-mocks"
end

group :test do
  gem 'timecop'
  gem 'email_spec'
  gem "factory_girl_rails"
  gem 'shoulda-matchers', require: false
  gem 'simplecov', :require => false
end

group :production do |variable|
  gem 'rails_12factor'
end
