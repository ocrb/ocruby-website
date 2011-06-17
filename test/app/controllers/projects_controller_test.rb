require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "ProjectsController" do
  set :clean_database, true

  app Web

  context "GET :index" do
    setup { get '/projects' }

    asserts(:body).matches %r{Projects}
    asserts(:status).equals 200
  end
end
