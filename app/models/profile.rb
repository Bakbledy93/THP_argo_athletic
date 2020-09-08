class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :joint_profile_sports
  has_many :sports, through: :joint_profile_sports
end
