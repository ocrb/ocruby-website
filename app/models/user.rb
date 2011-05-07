class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name,  :type => String
  field :username,   :type => String
end
