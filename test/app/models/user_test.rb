require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "User Model" do
  purge!

  context "definition" do
    setup { User }

    asserts(:included_modules).includes Users::Authentication

    asserts_topic.has_field :first_name, :type => String
    asserts_topic.has_field :last_name,  :type => String
    asserts_topic.has_field :username,   :type => String
    asserts_topic.has_field :email,      :type => String
  end
end
