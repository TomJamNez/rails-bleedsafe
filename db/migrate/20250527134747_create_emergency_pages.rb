class CreateEmergencyPages < ActiveRecord::Migration[7.1]
  def change
    create_table :emergency_pages do |t|
      t.string :title
      t.text :step
      t.references :emergency_topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
