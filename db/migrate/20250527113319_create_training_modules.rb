class CreateTrainingModules < ActiveRecord::Migration[7.1]
  def change
    create_table :training_modules do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
