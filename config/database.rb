require 'uri'

Mongoid.configure do |config|
  if Padrino.env == :production
    uri  = URI.parse(ENV['MONGOLAB_URI'])
    conn = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'])
    config.master = conn.db(uri.path.gsub(/^\//, ''))
  else
    config.master = Mongo::Connection.new.db("web_#{Padrino.env}")
  end
end
