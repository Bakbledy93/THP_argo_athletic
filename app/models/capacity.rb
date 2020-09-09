class Capacity < ApplicationRecord
  has_many :roles_muscular_group_capacities
  has_many :sport_roles, through: :roles_muscular_group_capacities
  has_many :muscular_groups, through: :roles_muscular_group_capacities

  def self.my_import(file)
    capacities=[]
    CSV.foreach("db/capacities.csv", headers: true) do |row|
      capacities << Capacity.new(row.to_h)
    end
    puts '*'*150
    p capacities
    puts '*'*150

    Capacity.import capacities, recursive: true
  end
  belongs_to :quality
  has_many :training_methods
end
