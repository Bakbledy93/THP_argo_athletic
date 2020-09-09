class CreateMuscleVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :muscle_variants do |t|
      t.references :variant, foreign_key: true
      t.references :muscle, foreign_key: true

      t.timestamps
    end
  end
end
