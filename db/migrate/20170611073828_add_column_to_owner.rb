class AddColumnToOwner < ActiveRecord::Migration[5.0]
  def change
    add_column :owners, :nickname, :string
    add_column :owners, :self_introduction, :text
  end
end
