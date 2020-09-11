class AddForeignKeyToWorkoutProgramModel < ActiveRecord::Migration[5.2]
  def change
    add_reference :workout_programs, :profile, foreign_key: true
  end
end
