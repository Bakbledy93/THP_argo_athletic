class CreateExerciseVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_variants do |t|
      t.references :exercise, foreign_key: true
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
