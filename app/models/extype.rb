class Extype < ApplicationRecord
  has_many :variants

  def self.my_import(file)
    extypes =[]
    CSV.foreach("db/extypes.csv", headers: true) do |row|
      extypes  << Extype.new(row.to_h)
    end
    puts '*'*150
    p extypes 
    puts '*'*150

    Extype.import extypes , recursive: true
  end

end
