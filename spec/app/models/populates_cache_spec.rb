require File.join(File.dirname(__FILE__), "/../../spec_helper")

class SpecLookupClass
  def self.members
    "members_results"
  end

  def self.repos
    "repos_results"
  end
end

describe PopulatesCache do
  let(:cache) {
    cache = mock("Cache")
    cache.stubs(:set)
    cache
  }

  before do
    OcrbOrganization.stubs(:next_meetup).returns("next_meetup_result")
    OcrbOrganization.stubs(:members).returns("members_results")
    OcrbOrganization.stubs(:repos).returns("repos_results")
  end

  it "writes the next meetup result to the cache" do
    cache.expects(:set).with("next_meetup", "next_meetup_result", :expires_in => PopulatesCache::EXPIRES_IN)
    PopulatesCache.set(cache)
  end

  it "writes the members results to the cache" do
    cache.expects(:set).with("members", "members_results", :expires_in => PopulatesCache::EXPIRES_IN)
    PopulatesCache.set(cache)
  end

  it "writes the repos results to the cache" do
    cache.expects(:set).with("repos", "repos_results", :expires_in => PopulatesCache::EXPIRES_IN)
    PopulatesCache.set(cache)
  end

  it "returns a collection of the written results" do
    assert_equal %w[next_meetup_result members_results repos_results], PopulatesCache.set(cache)
  end
end
