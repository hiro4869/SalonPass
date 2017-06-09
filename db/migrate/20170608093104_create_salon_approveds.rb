class CreateSalonApproveds < ActiveRecord::Migration[5.0]
  def change
    create_table :salon_approveds do |t|
      t.integer :user_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
