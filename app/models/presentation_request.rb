class PresentationRequest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, :type => String

  validates_presence_of :content
  validates_length_of :content, :within => 3..255

  referenced_in :user 
end
