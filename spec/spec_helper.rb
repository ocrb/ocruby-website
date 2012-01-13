PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path('../../config/boot', __FILE__)
require File.join(File.dirname(__FILE__),'blueprints')

# Support Files
Dir.glob(File.expand_path('../support/*.rb',__FILE__)).each { |f| require f }

DatabaseCleaner.strategy = :truncation


class MiniTest::Unit::TestCase
  include Mocha::API
  include Rack::Test::Methods

  def app(a = nil)
    ##
    # You can handle all padrino applications using instead:
    #   Padrino.application
    #Shogun.tap { |app|  }
    @app = a if a
    @app || Padrino.application
  end
end
