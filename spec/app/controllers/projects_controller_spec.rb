require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Project do
  before do
    DatabaseCleaner.clean
    app Web
  end

  describe "GET :index" do
    before do
      get "/projects"
    end

    it "returns a valid response" do
      last_response.body.must_match %r{Projects}
      assert_equal 200, last_response.status
    end
  end
end
