class ApplicationMailer < ActionMailer::Base

  #default from: "user@realdomain.com"
  #default from: " Leia <hello@leiabearandfriends.com>"
  default from: "no-reply@leiabearandfriends.com"
  layout "mailer"
end
