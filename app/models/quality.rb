class Quality < ApplicationRecord
  has_many :capacities

  def self.my_import(file)
    qualities =[]
    CSV.foreach("db/qualities.csv", headers: true) do |row|
      qualities << Quality.new(row.to_h)
    end
    puts '*'*150
    p qualities
    puts '*'*150

    Quality.import qualities, recursive: true
  end

end
