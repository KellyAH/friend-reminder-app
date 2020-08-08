source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# NOTE: if updating ruby version ALSO update .ruby-version
ruby '2.6.5'

gem 'rails',      '6.0.2.1'
gem 'puma',       '3.12.2'
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.5', require: false
# NOTE: bundle install will fail to install postgres unless
# this is executed 1st:
# 1. brew update
# 2. brew install postgresql
gem 'pg', '1.1.4'

group :development, :test do
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
end

# Don't add mailcatcher. It will conflict with your applications gems at some point.
group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',           '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  gem 'webdrivers',         '4.1.2'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simplecov', require: false, group: :test
