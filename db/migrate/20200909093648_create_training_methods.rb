class CreateTrainingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :training_methods do |t|
      t.string :name
      t.references :capacity, foreign_key: true

      t.timestamps
    end
  end
end
