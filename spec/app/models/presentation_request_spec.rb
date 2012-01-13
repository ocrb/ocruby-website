require File.join(File.dirname(__FILE__), "/../../spec_helper")

describe PresentationRequest do
  subject { PresentationRequest }

  it "has a field content type with String" do
    assert_has_field subject, :content, :type => String
  end

  it "validates the presence of content" do
    assert_has_validation subject, :validates_presence_of, :content
  end

  it "validates the length of content within 2 and 255" do
    assert_has_validation subject, :validates_length_of, :content, :within => 3..255
  end

  it "has an association referenced in user" do
    assert_has_association subject, :referenced_in, :user
  end
end
