class Level < ApplicationRecord
  has_many :training_method_levels
  has_many :training_methods ,through: :training_method_levels

end
