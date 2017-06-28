class RenameOwnerIdColumnToSalonApplyings < ActiveRecord::Migration[5.0]
  def change
    rename_column :salon_applyings, :owner_id, :salon_id
  end
end
