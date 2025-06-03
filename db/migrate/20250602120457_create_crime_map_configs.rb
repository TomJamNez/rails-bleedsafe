class CreateCrimeMapConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :crime_map_configs do |t|
      t.string :key
      t.decimal :value

      t.timestamps
    end
  end
end
