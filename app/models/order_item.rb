class OrderItem < ApplicationRecord

  belongs_to :items
  belongs_to :orders
  
  enum sales_order_status: { 
 impossible:0, wait:1, making:2, done:3 
  }


end
