class Sport < ApplicationRecord
  has_many :joint_profile_sports
  has_many :profiles, through: :joint_profile_sports
end
