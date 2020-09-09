class SportRole < ApplicationRecord
  belongs_to :sport
  def self.my_import(file)
    sports_roles=[]
    CSV.foreach("db/sport_roles.csv", headers: true) do |row|
      sports_roles << SportRole.new(row.to_h)
    end
    puts '*'*150
    p sports_roles
    puts '*'*150

    SportRole.import sports_roles, recursive: true
  end

  has_many :roles_muscular_group_capacities
  has_many :muscular_groups, through: :roles_muscular_group_capacities
end
