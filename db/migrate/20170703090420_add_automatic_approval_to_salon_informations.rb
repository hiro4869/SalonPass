class AddAutomaticApprovalToSalonInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :salon_informations, :automatic_approval, :boolean, default: false
  end
end
