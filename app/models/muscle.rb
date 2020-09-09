class Muscle < ApplicationRecord
  belongs_to :muscular_group

  has_many :muscle_variants
  has_many :variants, through: :muscle_variants

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
