class CreateJointProfileSports < ActiveRecord::Migration[5.2]
  def change
    create_table :joint_profile_sports do |t|

      t.timestamps
    end
  end
end
