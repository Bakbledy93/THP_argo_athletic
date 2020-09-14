class TrainingMethodLevel < ApplicationRecord
  belongs_to :level
  belongs_to :training_method

  def self.my_import(file)
    method_levels=[]
    CSV.foreach(file.path, headers: true) do |row|
      method_levels << TrainingMethodLevel.new(row.to_h)
    end
    puts '*'*150
    p method_levels
    puts '*'*150

    TrainingMethodLevel.import method_levels, recursive: true
  end

end
