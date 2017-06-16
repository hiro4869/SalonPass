class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :purchase_num

      t.timestamps
    end
  end
end
