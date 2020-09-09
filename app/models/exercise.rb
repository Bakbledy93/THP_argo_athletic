class Exercise < ApplicationRecord
  has_many :training_method_exercise
  has_many :training_methods ,through: :training_method_exercise

  has_many :exercise_variants
  has_many :variants ,through: :exercise_variants
end
