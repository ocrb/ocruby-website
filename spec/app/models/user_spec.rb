require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe User do

  it "has fields" do
    user = User.new 

    assert_includes User.included_modules, Users::Authentication

    assert_has_field user, :first_name,      :type => String
    assert_has_field user, :last_name,       :type => String
    assert_has_field user, :username,        :type => String
    assert_has_field user, :email,           :type => String
    assert_has_field user, :github_username, :type => String

    assert_has_field user, :description, :type => String

    assert_has_validation user, :validates_presence_of,   :username
    assert_has_validation user, :validates_uniqueness_of, :username, :case_sensitive => false
    assert_has_validation user, :validates_length_of,     :username, :within => 1..30, :on => :create
    assert_has_validation user, :validates_form_of,       :username, :with => %r{\w}

    assert_has_validation user, :validates_presence_of,   :email
    assert_has_validation user, :validates_uniqueness_of, :email,    :case_sensitive => false
    assert_has_validation user, :validates_format_of,     :email,    :with => %r{\w+@\w+\.\w+}
    assert_has_validation user, :validates_length_of,     :email,    :within => 4..320

    # I can't yet find the github username requirements on length/format, so taking a stab
    assert_has_validation user, :validates_uniqueness_of, :github_username, :case_sensitive => false
    assert_has_validation user, :validates_format_of, :github_username, :with => /\w*/i
    assert_has_validation user, :validates_length_of, :github_username,
                                 :within => 3..30, :allow_blank => true

    assert_has_association user, :references_many, :projects

    assert_has_association user, :references_many, :presentation_requests
  end
end
