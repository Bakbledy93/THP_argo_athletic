class TrainingMethodExercise < ApplicationRecord
  belongs_to :training_method
  belongs_to :exercise

  def self.my_import(file)
    training_method_exercises=[]
    CSV.foreach("db/training_method_exercises.csv", headers: true) do |row|
      training_method_exercises << TrainingMethodExercise.new(row.to_h)
    end
    puts '*'*150
    p training_method_exercises
    puts '*'*150

    TrainingMethodExercise.import training_method_exercises, recursive: true
  end

end
