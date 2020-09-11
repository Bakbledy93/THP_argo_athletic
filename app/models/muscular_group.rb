class MuscularGroup < ApplicationRecord
  has_many :roles_muscular_group_capacities
  has_many :sport_roles, through: :roles_muscular_group_capacities
  has_many :capacities, through: :roles_muscular_group_capacities
  has_many :muscles

  def self.my_import(file)
    muscular_groups=[]
    CSV.foreach("db/muscular_groups.csv", headers: true) do |row|
      muscular_groups << MuscularGroup.new(row.to_h)
    end
    puts '*'*150
    p muscular_groups
    puts '*'*150

    MuscularGroup.import muscular_groups, recursive: true
  end
end
