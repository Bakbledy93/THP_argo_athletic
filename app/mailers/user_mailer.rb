class UserMailer < ApplicationMailer

  default from: 'argo.sender@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://thp-argo-prod.herokuapp.com/users/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def sub_email(user)
    @user = user 
    @url  = 'https://thp-argo-prod.herokuapp.com/users/' 
    mail(to: @user.email, subject: 'Ton abonnnement est prêt!') 
  end

end
