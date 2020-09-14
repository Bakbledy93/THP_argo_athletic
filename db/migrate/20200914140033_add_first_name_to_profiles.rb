class AddFirstNameToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :first_name, :string
  end
end
