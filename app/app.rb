class Web < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  set :haml, :format => :html5

  ##
  # Caching support
  #
  register Padrino::Cache
  enable :caching
  Padrino.cache = if Padrino.env == :production
    Padrino::Cache::Store::Memcache.new(::Dalli::Client.new)
  else
    Padrino.cache = Padrino::Cache::Store::Memory.new(10_000)
  end
  set :cache, Padrino.cache

  ##
  # Routes
  #

  get "/" do
    @next_meetup = cache(PopulatesCache::NEXT_MEETUP_KEY, :expires_in => PopulatesCache::EXPIRES_IN) do
      OcrbOrganization.next_meetup
    end

    @members = cache(PopulatesCache::MEMBERS_KEY, :expires_in => PopulatesCache::EXPIRES_IN) do
      OcrbOrganization.members
    end

    @repos = cache(PopulatesCache::REPOS_KEY, :expires_in => PopulatesCache::EXPIRES_IN) do
      OcrbOrganization.repos
    end

    render :index
  end

  ## 
  # Run in a crontab somewhere...
  # curl -s -X PUT http://ocrb-staging.heroku.com/populates_cache -d ""
  put "/populates_cache" do
    PopulatesCache.set
    "ok"
  end

end
