class Intensity < ApplicationRecord
  has_many :training_method_intensities
  has_many :training_methods ,through: :training_method_intensities

  def self.my_import(file)
    intensities =[]
    CSV.foreach("db/intensities.csv", headers: true) do |row|
      intensities  << Intensity.new(row.to_h)
    end
    puts '*'*150
    p intensities 
    puts '*'*150

    Intensity.import intensities , recursive: true
  end

end
