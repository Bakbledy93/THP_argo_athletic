class CreateTrainingMethodLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :training_method_levels do |t|
      t.references :level, foreign_key: true
      t.references :training_method, foreign_key: true

      t.timestamps
    end
  end
end
