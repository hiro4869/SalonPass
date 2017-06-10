class CreateSalonInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :salon_informations do |t|
      t.integer :salon_id
      t.string :salon_name
      t.text :salon_description

      t.timestamps
    end
  end
end
