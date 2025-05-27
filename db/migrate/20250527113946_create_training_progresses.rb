class CreateTrainingProgresses < ActiveRecord::Migration[7.1]
  def change
    create_table :training_progresses do |t|
      t.string :state
      t.references :user, null: false, foreign_key: true
      t.references :training_topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
