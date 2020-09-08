class ChangeJointProfileSportsTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :joint_profile_sports, :sport_profiles
  end
end
