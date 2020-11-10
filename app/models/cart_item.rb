class CartItem
    include Mongoid::Document
    include Mongoid::Timestamps
    belongs_to :cart
    belongs_to :item
    field :quantity, type: Float
  end
  