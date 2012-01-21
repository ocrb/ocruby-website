module PopulatesCache
  EXPIRES_IN = 3600 # 1 hour
  NEXT_MEETUP_KEY = "next_meetup"
  MEMBERS_KEY = "members"
  REPOS_KEY = "repos"

  def self.set(cache = Padrino.cache, &block)
    [NEXT_MEETUP_KEY, MEMBERS_KEY, REPOS_KEY].map do |meth|
      results = OcrbOrganization.send(meth)
      cache.set(meth.to_s, results, :expires_in => EXPIRES_IN)
      results
    end
  end
end
