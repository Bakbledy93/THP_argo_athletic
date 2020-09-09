class TrainingMethod < ApplicationRecord
  belongs_to :capacity

  has_many :training_method_exercise
  has_many :exercises ,through: :training_method_exercise
  
  has_many :training_method_levels
  has_many :levels ,through: :training_method_levels

  has_many :training_method_intensities
  has_many :intensities ,through: :training_method_intensities

  def self.my_import(file)
    training_methods =[]
    CSV.foreach("db/training_methods.csv", headers: true) do |row|
      training_methods  << TrainingMethod.new(row.to_h)
    end
    puts '*'*150
    p training_methods 
    puts '*'*150

    TrainingMethod.import training_methods , recursive: true
  end
  
end
