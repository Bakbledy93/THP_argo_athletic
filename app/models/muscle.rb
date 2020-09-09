class Muscle < ApplicationRecord
  belongs_to :muscular_group

  has_many :muscle_variants
  has_many :variants, through: :muscle_variants
end
