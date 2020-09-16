class AddVariantAndSerieColumnsToWorkoutProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :workout_programs, :variant, :integer
    add_column :workout_programs, :serie, :integer
  end
end
