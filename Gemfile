source :rubygems

# Project requirements
gem 'rake'
gem 'rack-flash'
gem 'thin' # or mongrel

# Component requirements
gem 'haml'
gem 'sass'
gem 'SystemTimer', :require => "system_timer"
# Mongo
gem 'mongoid', "2.0.0"
gem 'bson_ext', :require => "mongo"
# Authentication
gem 'bcrypt-ruby', :require => 'bcrypt'

# Test requirements

group :test do
  gem 'machinist'
  gem 'machinist_mongo', :require => 'machinist/mongoid'
  gem 'rr'
  gem 'riot'
  gem 'riot-mongoid', "2.0.0.beta.rc.7"
  gem 'database_cleaner'
  gem 'rack-test', :require => "rack/test"
  gem 'watchr'
end

# Padrino
gem 'padrino', :git => "git://github.com/padrino/padrino-framework.git"
