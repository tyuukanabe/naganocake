class CartItem < ApplicationRecord

  attachment :image
  belongs_to :customers
  belongs_to :items

end
