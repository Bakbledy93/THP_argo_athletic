class Muscle < ApplicationRecord
  belongs_to :muscular_group

  has_many :exercise_variants
  has_many :variants ,through: :exercise_variants
  has_many :exercises ,through: :exercise_variants

  def self.my_import(file)
    muscles=[]
    CSV.foreach("db/muscles.csv", headers: true) do |row|
      muscles << Muscle.new(row.to_h)
    end
    puts '*'*150
    p muscles
    puts '*'*150

    Muscle.import muscles, recursive: true
  end
  
end
