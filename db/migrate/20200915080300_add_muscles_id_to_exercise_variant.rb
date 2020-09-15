class AddMusclesIdToExerciseVariant < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercise_variants, :muscle, foreign_key: true
  end
end
