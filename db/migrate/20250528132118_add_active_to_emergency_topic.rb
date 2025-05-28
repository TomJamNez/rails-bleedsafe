class AddActiveToEmergencyTopic < ActiveRecord::Migration[7.1]
  def change
    add_column :emergency_topics, :active, :boolean
  end
end
