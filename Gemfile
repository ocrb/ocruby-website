source :rubygems

# Project requirements
gem 'rake'
gem 'rack-flash'
gem 'thin' # or mongrel

# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'haml'
gem 'compass'
gem 'SystemTimer', :require => "system_timer", :platforms => :mri_18
# Mongo
gem 'mongoid', "2.0.0"
gem 'bson_ext', :require => "mongo"
# Authentication
gem 'bcrypt-ruby', :require => 'bcrypt'

# Test requirements

group :test do
  gem 'machinist'
  gem 'machinist_mongo', :require => 'machinist/mongoid'
  gem 'faker'
  gem 'database_cleaner'
  gem 'rack-test', :require => "rack/test"
  gem 'watchr'
  gem 'jasmine', '1.0.2.1'
  gem 'mocha'
  gem 'minitest',         :require => 'minitest/autorun'
  gem 'purdytest'
  gem 'minitest-mongoid'
end

# Padrino
gem 'padrino', :git => "git://github.com/padrino/padrino-framework.git"
