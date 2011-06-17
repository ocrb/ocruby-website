require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

context "PresentationRequest Model" do
  set :clean_database, true

  context "definition" do
    setup { PresentationRequest }

    asserts(:included_modules).includes Mongoid::Timestamps

    asserts_topic.has_field :content, :type => String

    asserts_topic.has_validation :validates_presence_of, :content
    asserts_topic.has_validation :validates_length_of, :content, :within => 3..255

    asserts_topic.has_association :referenced_in, :user
  end
end
