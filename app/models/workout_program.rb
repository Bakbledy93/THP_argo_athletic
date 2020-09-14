class WorkoutProgram < ApplicationRecord
  belongs_to :profile


  def self.profile_id_array_creator
    profiles = Profile.all
    arr_profiles = []
    profiles.each do |profile|
      arr_profiles << profile.id
    end
    arr_profiles
  end

  def self.array_id_creator(model)
    array = []
    model.all.each do |data|
      array << data.id
    end
    array
  end

  def self.array_name_creator(model)
    array = []
    model.all.each do |data|
      array << data.name
    end
    array
  end

end
