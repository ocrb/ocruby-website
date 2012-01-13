require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe PresentationRequest do
  before do
    app Web
  end

  describe "GET :index" do
    before do
      2.times { PresentationRequest.make }
      get "/presentation_requests"
    end

    it "returns a valid response" do
      assert_includes last_response.body, PresentationRequest.first.content
      assert_includes last_response.body, PresentationRequest.last.content

      assert_equal 200, last_response.status
    end
  end
end
