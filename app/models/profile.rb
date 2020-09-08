class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :sport_profiles
  has_many :sports, through: :sport_profiles
end
