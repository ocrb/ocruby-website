# Decouple this or use a real github api if you need more info.
# simple for now
require 'ostruct'

class OcrbOrganization
  include HTTParty

  class Member < OpenStruct
    def profile_url
      "https://github.com/#{login}"
    end
  end

  class Repo < OpenStruct; end

  base_uri 'https://api.github.com'

  ORG_NAME = 'ocrb'

  def self.members
    _members.map do |member|
      Member.new(member)
    end
  end

  def self.repos
    _repos.map do |repo|
      Repo.new(repo)
    end.reject(&:fork)
  end

  protected

  def self._members
    # Just request max users to avoid paging until we need it
    get("/orgs/#{ORG_NAME}/members?per_page=100")
  end

  def self._repos
    get("/users/#{ORG_NAME}/repos?per_page=100")
  end
end
