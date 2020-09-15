class Variant < ApplicationRecord
  belongs_to :extype

  has_many :exercise_variants
  has_many :exercises ,through: :exercise_variants

  def self.my_import(file)
    variants=[]
    CSV.foreach("db/variants.csv", headers: true) do |row|
      variants << Variant.new(row.to_h)
    end
    puts '*'*150
    p variants
    puts '*'*150

    Variant.import variants, recursive: true
  end
  
end
