class DropProfileIdFromSports < ActiveRecord::Migration[5.2]
  def change
    remove_column :sports, :profile_id
  end
end
