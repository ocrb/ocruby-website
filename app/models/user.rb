class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Users::Authentication

  field :first_name,      :type => String
  field :last_name,       :type => String
  field :username,        :type => String
  field :email,           :type => String
  field :github_username, :type => String

  field :description,     :type => String

  validates_presence_of   :username
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of     :username, :within => 1..30, :on => :create
  validates_format_of     :username, :with => %r{\w}

  validates_presence_of   :email
  validates_uniqueness_of :email,    :case_sensitive => false
  validates_format_of     :email,    :with => %r{\w+@\w+\.\w+}
  validates_length_of     :email,    :within => 4..320

  validates_uniqueness_of :github_username , :case_sensitive => false
  validates_format_of     :github_username , :with => /^[a-z0-9]$/i
  validates_length_of     :github_username , :within => 3..30, :allow_blank => true

  references_many :projects

  references_many :presentation_requests
end
