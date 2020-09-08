class CreateSportRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :sport_roles do |t|
      t.string :name
      t.references :sport, index: true

      t.timestamps
    end
  end
end
