class CreateWorkoutPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_programs do |t|
      t.string :exercise
      t.string :training_method
      t.string :level
      t.string :repetition
      t.string :recuperation

      t.timestamps
    end
  end
end
