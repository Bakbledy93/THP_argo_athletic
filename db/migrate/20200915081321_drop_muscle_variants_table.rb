class DropMuscleVariantsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :muscle_variants
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
