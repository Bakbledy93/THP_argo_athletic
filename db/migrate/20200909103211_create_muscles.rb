class CreateMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :muscles do |t|
      t.string :name
      t.references :muscular_group, foreign_key: true

      t.timestamps
    end
  end
end
