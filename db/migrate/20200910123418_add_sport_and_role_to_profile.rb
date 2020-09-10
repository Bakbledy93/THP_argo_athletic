class AddSportAndRoleToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :sport
    add_column :profiles, :sport_role
  end
end
