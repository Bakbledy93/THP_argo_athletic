class CreateTrainingMethodExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :training_method_exercises do |t|
      t.references :training_method, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
