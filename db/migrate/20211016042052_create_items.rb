class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.boolean :is_status

      t.timestamps
    end
  end
end
