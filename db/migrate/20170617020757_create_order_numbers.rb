class CreateOrderNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :order_numbers do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
