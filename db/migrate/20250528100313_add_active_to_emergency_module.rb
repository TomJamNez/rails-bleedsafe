class AddActiveToEmergencyModule < ActiveRecord::Migration[7.1]
  def change
    add_column :emergency_modules, :active, :boolean
  end
end
