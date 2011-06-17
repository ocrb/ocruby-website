require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "PresentationRequestsController" do
  set :clean_database, true

  app Web

  context "GET :index" do
    setup do
      2.times { PresentationRequest.make }
      get "/presentation_requests"
    end

    asserts(:status).equals 200
    asserts(:body).matches PresentationRequest.first.content
    asserts(:body).matches PresentationRequest.last.content
  end
end
