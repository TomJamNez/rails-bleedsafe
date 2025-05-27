class CreateFirstAidMaps < ActiveRecord::Migration[7.1]
  def change
    create_table :first_aid_maps do |t|
      t.string :name
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
