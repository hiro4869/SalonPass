class RenameOwnerIdColumnToSalonApproveds < ActiveRecord::Migration[5.0]
  def change
    rename_column :salon_approveds, :owner_id, :salon_id
  end
end
