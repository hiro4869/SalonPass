class AddImageToAlonInformations < ActiveRecord::Migration[5.0]
  def change
    add_column :salon_informations, :image, :string
  end
end
