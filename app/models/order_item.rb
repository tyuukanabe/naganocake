class OrderItem < ApplicationRecord

  belongs_to :items
  belongs_to :orders


end
