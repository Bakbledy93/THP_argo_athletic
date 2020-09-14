class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.all_tables 
    tables=[]
    ActiveRecord::Base.connection.tables.each do|x|
      tables << x
    end
    tables
  end

end
