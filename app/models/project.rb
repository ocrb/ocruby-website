class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,         :type => String
  field :description,  :type => String

  field :github_url,   :type => String
  field :rubygems_url, :type => String
  field :website_url,  :type => String

  referenced_in :user
end
