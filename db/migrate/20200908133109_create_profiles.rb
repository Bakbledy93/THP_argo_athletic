class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.datetime :date_of_birth
      t.integer :height
      t.integer :weight
      t.string :type

      t.timestamps
    end
  end
end
