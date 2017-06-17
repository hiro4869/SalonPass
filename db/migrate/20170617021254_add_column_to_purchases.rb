class AddColumnToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :order_number_id, :integer

    remove_column :purchases, :user_id, :integer
  end
end
