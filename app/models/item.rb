class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :photo, type: String
  field :price, type: Float
  field :description, type: String
  field :vendor_name, type: String
end