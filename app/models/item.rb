class Item
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :photo, type: String
  field :price, type: Float
  field :quantity, type: Float
  field :description, type: String
  field :vendor_name, type: String
  has_many :cart_item
  
  mount_base64_uploader :photo, PhotoUploader
end
