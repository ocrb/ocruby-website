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
    asserts("that it contains first presentation request") { topic.body.include? PresentationRequest.first.content }
    asserts("that it contains last presentation request") { topic.body.include? PresentationRequest.last.content }
  end
end
