require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe OcrbOrganization do
  def raw_members_fixture
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

  def raw_user_repos_fixture
    '[
      {
        "clone_url": "https://github.com/justinbeltran/ruby_koans.git",
        "open_issues": 0,
        "watchers": 1,
        "pushed_at": "2011-09-10T15:44:36Z",
        "homepage": "",
        "updated_at": "2011-10-04T18:33:10Z",
        "git_url": "git://github.com/justinbeltran/ruby_koans.git",
        "fork": false,
        "has_downloads": true,
        "html_url": "https://github.com/justinbeltran/ruby_koans",
        "has_issues": true,
        "language": "Ruby",
        "master_branch": null,
        "private": false,
        "forks": 1,
        "size": 216,
        "url": "https://api.github.com/repos/justinbeltran/ruby_koans",
        "svn_url": "https://github.com/justinbeltran/ruby_koans",
        "created_at": "2011-08-27T16:34:35Z",
        "owner": {
          "gravatar_id": "6519acd2ab9d9122cef08a7b346892ad",
          "login": "justinbeltran",
          "url": "https://api.github.com/users/justinbeltran",
          "avatar_url": "https://secure.gravatar.com/avatar/6519acd2ab9d9122cef08a7b346892ad?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
          "id": 6282
        },
        "name": "ruby_koans",
        "has_wiki": true,
        "id": 2279894,
        "ssh_url": "git@github.com:justinbeltran/ruby_koans.git",
        "description": "",
        "mirror_url": null
      },
      {
        "clone_url": "https://github.com/justinbeltran/dotfiles.git",
        "open_issues": 0,
        "watchers": 1,
        "pushed_at": "2011-08-24T17:04:16Z",
        "homepage": "",
        "updated_at": "2011-10-04T19:04:08Z",
        "git_url": "git://github.com/justinbeltran/dotfiles.git",
        "fork": true,
        "has_downloads": true,
        "html_url": "https://github.com/justinbeltran/dotfiles",
        "has_issues": false,
        "language": "Ruby",
        "master_branch": null,
        "private": false,
        "forks": 0,
        "size": 220,
        "url": "https://api.github.com/repos/justinbeltran/dotfiles",
        "svn_url": "https://github.com/justinbeltran/dotfiles",
        "created_at": "2011-09-09T03:51:25Z",
        "owner": {
          "gravatar_id": "6519acd2ab9d9122cef08a7b346892ad",
          "login": "justinbeltran",
          "url": "https://api.github.com/users/justinbeltran",
          "avatar_url": "https://secure.gravatar.com/avatar/6519acd2ab9d9122cef08a7b346892ad?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
          "id": 6282
        },
        "name": "dotfiles",
        "has_wiki": true,
        "id": 2353260,
        "ssh_url": "git@github.com:justinbeltran/dotfiles.git",
        "description": "My dot files yo",
        "mirror_url": null
      },
      {
        "clone_url": "https://github.com/justinbeltran/yelpr.git",
        "open_issues": 0,
        "watchers": 2,
        "pushed_at": "2012-02-27T01:18:28Z",
        "homepage": "",
        "updated_at": "2012-02-27T01:18:30Z",
        "git_url": "git://github.com/justinbeltran/yelpr.git",
        "fork": false,
        "has_downloads": true,
        "html_url": "https://github.com/justinbeltran/yelpr",
        "has_issues": true,
        "language": "Ruby",
        "master_branch": null,
        "private": false,
        "forks": 1,
        "size": 348,
        "url": "https://api.github.com/repos/justinbeltran/yelpr",
        "svn_url": "https://github.com/justinbeltran/yelpr",
        "created_at": "2011-11-05T16:24:19Z",
        "owner": {
          "gravatar_id": "6519acd2ab9d9122cef08a7b346892ad",
          "login": "justinbeltran",
          "url": "https://api.github.com/users/justinbeltran",
          "avatar_url": "https://secure.gravatar.com/avatar/6519acd2ab9d9122cef08a7b346892ad?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
          "id": 6282
        },
        "name": "yelpr",
        "has_wiki": true,
        "id": 2715987,
        "ssh_url": "git@github.com:justinbeltran/yelpr.git",
        "description": "Ruby Yelp gem for the masses",
        "mirror_url": null
      }
    ]'
  end

  def raw_repos_fixture
    '[
      {
        "open_issues": 12,
        "master_branch": null,
        "pushed_at": "2012-01-20T09:34:17Z",
        "updated_at": "2012-01-20T09:34:17Z",
        "clone_url": "https://github.com/ocrb/ocruby-website.git",
        "ssh_url": "git@github.com:ocrb/ocruby-website.git",
        "language": "Ruby",
        "has_issues": true,
        "git_url": "git://github.com/ocrb/ocruby-website.git",
        "has_downloads": true,
        "created_at": "2011-04-29T04:05:24Z",
        "fork": false,
        "mirror_url": null,
        "description": "The ocruby-website",
        "private": false,
        "watchers": 7,
        "forks": 3,
        "size": 176,
        "svn_url": "https://github.com/ocrb/ocruby-website",
        "has_wiki": true,
        "owner": {
          "gravatar_id": "09969f7ceda02813c99d8775ab81614e",
          "login": "ocrb",
          "url": "https://api.github.com/users/ocrb",
          "avatar_url": "https://secure.gravatar.com/avatar/09969f7ceda02813c99d8775ab81614e?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
          "id": 702998
        },
        "name": "ocruby-website",
        "id": 1679309,
        "url": "https://api.github.com/repos/ocrb/ocruby-website",
        "html_url": "https://github.com/ocrb/ocruby-website",
        "homepage": "http://ocruby.org"
      },
      {
        "open_issues": 0,
        "master_branch": null,
        "pushed_at": "2012-01-20T04:35:34Z",
        "updated_at": "2012-01-20T04:35:36Z",
        "clone_url": "https://github.com/ocrb/cinch-bot.git",
        "ssh_url": "git@github.com:ocrb/cinch-bot.git",
        "language": "Ruby",
        "has_issues": true,
        "git_url": "git://github.com/ocrb/cinch-bot.git",
        "has_downloads": true,
        "created_at": "2011-09-09T02:16:53Z",
        "fork": false,
        "mirror_url": null,
        "description": "Bot for the #ocruby irc chatroom",
        "private": false,
        "watchers": 3,
        "forks": 2,
        "size": 112,
        "svn_url": "https://github.com/ocrb/cinch-bot",
        "has_wiki": true,
        "owner": {
          "gravatar_id": "09969f7ceda02813c99d8775ab81614e",
          "login": "ocrb",
          "url": "https://api.github.com/users/ocrb",
          "avatar_url": "https://secure.gravatar.com/avatar/09969f7ceda02813c99d8775ab81614e?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png",
          "id": 702998
        },
        "name": "cinch-bot",
        "id": 2352901,
        "url": "https://api.github.com/repos/ocrb/cinch-bot",
        "html_url": "https://github.com/ocrb/cinch-bot",
        "homepage": ""
      }
    ]'
  end

  describe "members" do
    let(:subject) { OcrbOrganization.members }

    before do
      FakeWeb.register_uri(:get, "https://api.github.com/orgs/ocrb/members?per_page=100", :body => raw_members_fixture,
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

  describe "repos" do
    let(:subject) { OcrbOrganization.repos }

    before do
      FakeWeb.register_uri(:get, "https://api.github.com/users/ocrb/repos?per_page=100", :body => raw_repos_fixture,
                           :status => ["200"], "Content-Type" => "application/json")
    end


    after do
      FakeWeb.clean_registry
    end

    it "can fetch the repos on github" do
      assert_equal "ocruby-website", subject[0].name
      assert_equal "cinch-bot", subject[1].name
    end
  end

  describe "user_repos" do
    let(:subject) { OcrbOrganization.user_repos }

    before do
      OcrbOrganization.expects(:members).returns([OcrbOrganization::Member.new('login' => 'justinbeltran')])
      FakeWeb.register_uri(:get, "https://api.github.com/users/justinbeltran/repos?per_page=100", :body => raw_user_repos_fixture,
                           :status => ["200"], "Content-Type" => "application/json")
    end

    after do
      FakeWeb.clean_registry
    end

    it "can fetch the repos on github" do
      assert_equal "ruby_koans", subject[0].name
      assert_equal "yelpr",      subject[1].name
      assert_equal 2,            subject.size
    end
  end
end

describe OcrbOrganization::Member do
  it "has a profile_url based on their login" do
    member = OcrbOrganization::Member.new(:login => "johndoe")
    assert_equal "https://github.com/johndoe", member.profile_url
  end
end
