class MuscularGroup < ApplicationRecord
  has_many :roles_muscular_group_capacities
  has_many :sport_roles, through: :roles_muscular_group_capacities
  has_many :capacities, through: :roles_muscular_group_capacities

end
