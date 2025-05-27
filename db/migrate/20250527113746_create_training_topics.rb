class CreateTrainingTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :training_topics do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.references :training_module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
