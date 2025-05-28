class AddActiveToEmergencyPage < ActiveRecord::Migration[7.1]
  def change
    add_column :emergency_pages, :active, :boolean
  end
end
