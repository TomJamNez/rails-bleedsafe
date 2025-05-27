class CreateEmergencyTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :emergency_topics do |t|
      t.string :name
      t.text :description
      t.references :emergency_module, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
