class Level < ApplicationRecord
  has_many :training_method_levels
  has_many :training_methods ,through: :training_method_levels

  def self.my_import(file)
    levels =[]
    CSV.foreach("db/levels.csv", headers: true) do |row|
      levels  << Level.new(row.to_h)
    end
    puts '*'*150
    p levels 
    puts '*'*150

    Level.import levels , recursive: true
  end

end
