class CreateJointProfileSports < ActiveRecord::Migration[5.2]
  def change
    create_table :joint_profile_sports do |t|
      t.references :profile, index: true
      t.references :sport, index: true

      t.timestamps
    end
  end
end
