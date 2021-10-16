class Order < ApplicationRecord

  belogs_to :customer
  has_many :order_items, dependent: :destroy

end
