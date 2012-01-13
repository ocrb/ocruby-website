require File.expand_path('../../../spec_helper', __FILE__)

describe Project do

  it "has fields" do
    project = Project.new

    assert_includes Project.included_modules, Mongoid::Timestamps

    assert_has_field project, :name, :type => String

    assert_has_field project, :description,  :type => String

    assert_has_field project, :github_url,   :type => String
    assert_has_field project, :rubygems_url, :type => String
    assert_has_field project, :website_url,  :type => String

    assert_has_association project, :referenced_in, :user
  end

end
