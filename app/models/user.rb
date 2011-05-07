class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Users::Authentication

  field :first_name, :type => String
  field :last_name,  :type => String
  field :username,   :type => String
end
