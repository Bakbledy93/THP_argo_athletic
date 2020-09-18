class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_one_attached :avatar
  
  after_create :welcome_send, :profile_creation

  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def profile_creation
    puts "hello"
    puts email
    puts User.find_by(email: email).id
    
    p = Profile.new(
      user_id: User.find_by(email: email).id
    )
    p.save(validate: false)
  end
  
end
