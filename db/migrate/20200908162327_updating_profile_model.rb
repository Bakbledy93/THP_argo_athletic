class UpdatingProfileModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :sport_id
  end
end
