class Variant < ApplicationRecord
  belongs_to :extype

  has_many :exercise_variants

  has_many :muscle_variants
  has_many :muscles, through: :muscle_variants
end
