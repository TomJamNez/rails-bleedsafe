class CreateCrimePostcodeExclusions < ActiveRecord::Migration[7.1]
  def change
    create_table :crime_postcode_exclusions do |t|
      t.string :postcode

      t.timestamps
    end
  end
end
