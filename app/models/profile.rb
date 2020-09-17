class Profile < ApplicationRecord
  belongs_to :user
  
  has_many :sport_profiles
  has_many :sports, through: :sport_profiles
  has_many :workout_programs

  validates :first_name,
    presence: true,
    format: { with: /\A\D+\z/, message: "Numbers are not allowed" }
  validates :weight, 
    presence: true,
    numericality: {only_float: true}
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

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

  def self.level_array_creator
    levels = Level.all
    arr_levels = []
    levels.each do |level|
      arr_levels << level.name
    end
    arr_levels
  end

end
