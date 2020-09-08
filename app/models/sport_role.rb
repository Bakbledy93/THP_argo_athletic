class SportRole < ApplicationRecord
  belongs_to :sport

  has_many :roles_muscular_group_capacities
  has_many :muscular_groups, through: :roles_muscular_group_capacities
end
