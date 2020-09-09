class Intensity < ApplicationRecord
  has_many :training_method_intensities
  has_many :training_methods ,through: :training_method_intensities

end
