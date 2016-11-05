class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :discount
      t.string :brand
      t.string :color
      t.string :size
      t.string :category
      t.boolean :availability

      t.timestamps null: false
    end
  end
end
