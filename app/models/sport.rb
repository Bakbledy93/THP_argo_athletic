class Sport < ApplicationRecord
  belongs_to :profile

  has_many :joint_profile_sports
  has_many :profiles, through: :joint_profile_sports
end
