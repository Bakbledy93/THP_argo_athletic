class AddSportIdToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :sport, foreign_key: true
  end
end
