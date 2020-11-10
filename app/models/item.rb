class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :photo, type: String
  field :price, type: Float
  field :description, type: String
  field :vendor_name, type: String

  has_and_belongs_to_many :carts
end
