class TrainingMethod < ApplicationRecord
  belongs_to :capacity

  has_many :training_method_exercise
  has_many :exercises ,through: :training_method_exercise
end
