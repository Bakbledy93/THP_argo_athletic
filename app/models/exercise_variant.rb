class ExerciseVariant < ApplicationRecord
  belongs_to :exercise
  belongs_to :variant

  def self.my_import(file)
    exercise_variants=[]
    CSV.foreach(file.path, headers: true) do |row|
      exercise_variants << ExerciseVariant.new(row.to_h)
    end
    puts '*'*150
    p exercise_variants
    puts '*'*150

    ExerciseVariant.import exercise_variants, recursive: true
  end

end
