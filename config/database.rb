Mongoid.configure do |config|
  if Padrino.env == :production
    config.master = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'])
  else
    config.master = Mongo::Connection.new.db("web_#{Padrino.env}")
  end
end
