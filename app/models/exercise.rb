class Exercise < ApplicationRecord
  has_many :training_method_exercise
  has_many :training_methods ,through: :training_method_exercise

end
