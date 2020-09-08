class CreateRolesMuscularGroupCapacities < ActiveRecord::Migration[5.2]
  def change
    create_table :roles_muscular_group_capacities do |t|
      t.references :sport_role, foreign_key: true
      t.references :muscular_group, foreign_key: true
      t.references :capacity, foreign_key: true

      t.timestamps
    end
  end
end
