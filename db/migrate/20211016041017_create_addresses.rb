class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
