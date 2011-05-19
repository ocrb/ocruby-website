class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Users::Authentication

  field :first_name,  :type => String
  field :last_name,   :type => String
  field :username,    :type => String
  field :email,       :type => String

  field :description, :type => String

  validates_presence_of   :username
  validates_uniqueness_of :username, :case_sensitive => false
  validates_length_of     :username, :within => 1..30, :on => :create
  validates_format_of     :username, :with => %r{\w}

  validates_presence_of   :email
  validates_uniqueness_of :email,    :case_sensitive => false
  validates_format_of     :email,    :with => %r{\w+@\w+\.\w+}
  validates_length_of     :email,    :within => 4..320

  references_many :projects
end
