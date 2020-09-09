class RolesMuscularGroupCapacity < ApplicationRecord
  belongs_to :sport_role
  belongs_to :muscular_group
  belongs_to :capacity
end
