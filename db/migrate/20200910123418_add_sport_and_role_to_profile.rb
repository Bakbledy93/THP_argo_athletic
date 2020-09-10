class AddSportAndRoleToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :sport, :string
    add_column :profiles, :sport_role, :string
  end
end
