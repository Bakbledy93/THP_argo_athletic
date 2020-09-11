class Exercise < ApplicationRecord
  has_many :training_method_exercise
  has_many :training_methods ,through: :training_method_exercise

  has_many :exercise_variants
  has_many :variants ,through: :exercise_variants

  def self.my_import(file)
    exercises =[]
    CSV.foreach("db/exercises.csv", headers: true) do |row|
      exercises  << Exercise.new(row.to_h)
    end
    puts '*'*150
    p exercises 
    puts '*'*150

    Exercise.import exercises , recursive: true
  end
  
end

