class Sport < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'

  def self.my_import(file)
    sports=[]
    CSV.foreach(file.path, headers: true) do |row|
      sports << Sport.new(row.to_h)
    end
    puts '*'*150
    p sports
    puts '*'*150

    Sport.import sports, recursive: true
  end

  has_many :sport_profiles
  has_many :profiles, through: :sport_profiles

  has_many :sport_roles
end
