class AddColumnToPostComment < ActiveRecord::Migration[5.0]
  def change
    add_column :post_comments, :owner_id, :integer
  end
end
