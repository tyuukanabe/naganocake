class OrderItem < ApplicationRecord
  
  belogs_to :items
  belogs_to :orders
  
end
