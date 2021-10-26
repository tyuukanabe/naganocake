class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :freight
      t.integer :payment_method
      t.string :ship_post_code
      t.string :ship_to_address
      t.string :ship_name
      t.integer :total_due
      t.integer :order_status

      t.timestamps
    end
  end
end
