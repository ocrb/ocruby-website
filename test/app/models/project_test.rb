require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "Project Model" do
  purge!

  context "definition" do
    setup { Project }

    asserts_topic.has_field :name,         :type => String
    asserts_topic.has_field :description,  :type => String

    asserts_topic.has_field :github_url,   :type => String
    asserts_topic.has_field :rubygems_url, :type => String
    asserts_topic.has_field :website_url,  :type => String

    asserts_topic.has_association :referenced_in, :user
  end
end
