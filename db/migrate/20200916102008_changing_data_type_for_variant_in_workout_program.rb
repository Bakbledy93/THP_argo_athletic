class ChangingDataTypeForVariantInWorkoutProgram < ActiveRecord::Migration[5.2]
  def change
    change_column(:workout_programs, :variant, :string)
  end
end
