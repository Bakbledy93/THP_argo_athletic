class Profile < ApplicationRecord
  has_one :user
  
  has_many :sport_profiles
  has_many :sports, through: :sport_profiles
end
