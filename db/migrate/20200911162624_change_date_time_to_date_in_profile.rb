class ChangeDateTimeToDateInProfile < ActiveRecord::Migration[5.2]
  def change
    change_column(:profiles, :date_of_birth, :date)
  end
end
