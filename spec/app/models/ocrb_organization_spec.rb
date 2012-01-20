require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe OcrbOrganization do
  def raw_fixture
    '[
      {
        "gravatar_id": "5107da17070b85827213aef1129ef61f",
        "avatar_url": "https://example.com/achiu",
        "login": "achiu",
        "url": "https://api.github.com/users/achiu",
        "id": 24772
      },
      {
        "gravatar_id": "cbb474a7852a90b1a64c904b8eef6eec",
        "avatar_url": "https://example.com/bemurphy",
        "login": "bemurphy",
        "url": "https://api.github.com/users/bemurphy",
        "id": 124661
        }
    ]'
  end

  describe "members" do
    let(:subject) { OcrbOrganization.members }

    before do
      FakeWeb.register_uri(:get, "https://api.github.com/orgs/ocrb/members?per_page=100", :body => raw_fixture,
                           :status => ["200"], "Content-Type" => "application/json")
    end


    after do
      FakeWeb.clean_registry
    end

    it "can fetch the members on github" do
      assert_equal "achiu", subject[0].login
      assert_equal "bemurphy", subject[1].login
    end

    it "includes member avatar urls" do
      assert_equal "https://example.com/achiu", subject[0].avatar_url
      assert_equal "https://example.com/bemurphy", subject[1].avatar_url
    end
  end
end

describe OcrbOrganization::Member do
  it "has a profile_url based on their login" do
    member = OcrbOrganization::Member.new(:login => "johndoe")
    assert_equal "https://github.com/johndoe", member.profile_url
  end
end
