class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { wait: 0, check: 1, making: 2, prepare: 3, shipped: 4 }

end
