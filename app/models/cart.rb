class Cart
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code, type: String
  field :description, type: String
  has_many :cart_item
end
