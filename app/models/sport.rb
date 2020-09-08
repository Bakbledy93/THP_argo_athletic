class Sport < ApplicationRecord
  has_many :sport_profiles
  has_many :profiles, through: :sport_profiles
end
