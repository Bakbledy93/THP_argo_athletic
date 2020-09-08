class AddProfileIdToSports < ActiveRecord::Migration[5.2]
  def change
    add_reference :sports, :profile, foreign_key: true
  end
end
