class ApplicationMailer < ActionMailer::Base
  default from: 'argo.sender@yopmail.com'
  
  layout 'mailer'
end
