class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :quantity
      t.integer :purchase_price
      t.integer :sales_order_status

      t.timestamps
    end
  end
end
