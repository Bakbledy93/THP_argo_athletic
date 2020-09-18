class UserMailer < ApplicationMailer

  default from: 'argo.sender@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://thp-argo-pro.herokuapp.com/users/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

end
