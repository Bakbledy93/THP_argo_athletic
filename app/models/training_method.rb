class TrainingMethod < ApplicationRecord
  belongs_to :capacity

  has_many :training_method_exercise
  has_many :exercises ,through: :training_method_exercise

  has_many :training_method_levels
  has_many :levels ,through: :training_method_levels

  has_many :training_method_intensities
  has_many :intensities ,through: :training_method_intensities

end
