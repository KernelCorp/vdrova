class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :phone, type: String
  field :text, type: String

  validates_presence_of [:username, :phone]

end
