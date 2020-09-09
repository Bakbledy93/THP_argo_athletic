class Variant < ApplicationRecord
  belongs_to :extype

  has_many :exercise_variants
end
