class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :sport_profiles
  has_many :sports, through: :sport_profiles

  has_one_attached :avatar

  def self.sport_array_creator
    sports = Sport.all
    arr_sport = []
    sports.each do |sport|
      arr_sport << sport.name
    end
    arr_sport
  end

  def self.sport_role_array_creator
    sport_roles = SportRole.all
    arr_sport_roles = []
    sport_roles.each do |role|
      arr_sport_roles << role.name
    end
    arr_sport_roles
  end
end
