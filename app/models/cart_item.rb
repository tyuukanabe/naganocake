class CartItem < ApplicationRecord
  
  attachment :image
  belogs_to :customers
  belogs_to :items
  
end
