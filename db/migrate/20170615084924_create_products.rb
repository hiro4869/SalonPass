class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :salon_id
      t.string :product_name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
