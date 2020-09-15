class AddPriorityToRoleMuscularGroupCapacity < ActiveRecord::Migration[5.2]
  def change
    add_column :roles_muscular_group_capacities, :priority, :integer
  end
end
