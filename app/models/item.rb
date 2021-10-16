class Item < ApplicationRecord
  
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belogs_to :genres

end
