class TrainingMethodIntensity < ApplicationRecord
  belongs_to :intensity
  belongs_to :training_method

  def self.my_import(file)
    method_intensities=[]
    CSV.foreach(file.path, headers: true) do |row|
      method_intensities << TrainingMethodIntensity.new(row.to_h)
    end
    puts '*'*150
    p method_intensities
    puts '*'*150

    TrainingMethodIntensity.import method_intensities, recursive: true
  end
  
end
