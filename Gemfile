source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


#        _ _                   _                                      _
#   __ _| | |   ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_ ___
#  / _` | | |  / _ \ '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __/ __|
# | (_| | | | |  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_\__ \
#  \__,_|_|_|  \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|___/

gem 'rails'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# These are commented out b/c I don't think I need them when developing on
# non-Windows systems. - Harish
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#      _                _                                  _
#   __| | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_
#  / _` |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
# | (_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_
#  \__,_|\___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
#                              |_|

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


#      _                 __  _            _
#   __| | _____   __    / / | |_ ___  ___| |_
#  / _` |/ _ \ \ / /   / /  | __/ _ \/ __| __|
# | (_| |  __/\ V /   / /   | ||  __/\__ \ |_
#  \__,_|\___| \_/   /_/     \__\___||___/\__|

group :development, :test do
  gem 'byebug', platform: :mri    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rubocop'
  gem 'factory_girl_rails'
  gem 'faker'
end


#  _            _
# | |_ ___  ___| |_
# | __/ _ \/ __| __|
# | ||  __/\__ \ |_
#  \__\___||___/\__|

group :test do
  gem 'shoulda-context'
end
