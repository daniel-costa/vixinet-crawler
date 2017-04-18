source 'https://rubygems.org'

# Basic
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'json'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1.7'
gem 'httparty'

# Front End
gem 'jquery-rails', '~> 4.2.1'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'

gem 'bootstrap-will_paginate'
gem 'will_paginate_mongoid'
gem 'will_paginate'

# Database
gem 'mongoid', '= 6.1.0'
gem 'simple_enum', '~> 2.0.0' , require: 'simple_enum/mongoid'

#bg jobs
gem "sidekiq"
# xpath
gem "nokogiri"

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production, :staging do
  gem 'rack-timeout'
  gem 'newrelic_rpm'
end

ruby "2.4.1"