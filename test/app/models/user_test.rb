require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "User Model" do
  set :clean_database, true

  context "definition" do
    setup { User }

    asserts(:included_modules).includes Users::Authentication

    asserts_topic.has_field :first_name,  :type => String
    asserts_topic.has_field :last_name,   :type => String
    asserts_topic.has_field :username,    :type => String
    asserts_topic.has_field :email,       :type => String

    asserts_topic.has_field :description, :type => String

    asserts_topic.has_validation :validates_presence_of,   :username
    asserts_topic.has_validation :validates_uniqueness_of, :username, :case_sensitive => false
    asserts_topic.has_validation :validates_length_of,     :username, :within => 1..30, :on => :create
    asserts_topic.has_validation :validates_form_of,       :username, :with => %r{\w}

    asserts_topic.has_validation :validates_presence_of,   :email
    asserts_topic.has_validation :validates_uniqueness_of, :email,    :case_sensitive => false
    asserts_topic.has_validation :validates_format_of,     :email,    :with => %r{\w+@\w+\.\w+}
    asserts_topic.has_validation :validates_length_of,     :email,    :within => 4..320

    asserts_topic.has_association :references_many, :projects

    asserts_topic.has_association :references_many, :presentation_requests
  end
end
