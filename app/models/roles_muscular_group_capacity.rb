class RolesMuscularGroupCapacity < ApplicationRecord
  belongs_to :sport_role
  belongs_to :muscular_group
  belongs_to :capacity

  def self.my_import(file)
    role_muscular_group_capacities=[]
    CSV.foreach("db/role_muscular_group_capacities.csv", headers: true) do |row|
      role_muscular_group_capacities << RolesMuscularGroupCapacity.new(row.to_h)
    end
    puts '*'*150
    p role_muscular_group_capacities
    puts '*'*150

    RolesMuscularGroupCapacity.import role_muscular_group_capacities, recursive: true
  end
end
