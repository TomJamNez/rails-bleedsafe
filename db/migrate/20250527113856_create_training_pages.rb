class CreateTrainingPages < ActiveRecord::Migration[7.1]
  def change
    create_table :training_pages do |t|
      t.string :title
      t.text :step
      t.boolean :active
      t.references :training_topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
