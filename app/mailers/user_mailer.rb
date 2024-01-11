#require 'aws-sdk-ses'

class UserMailer < ApplicationMailer



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject

  def account_activation(user)
    @user = user
    mail(from: 'no-reply@leiabearandfriends.com', to: user.email, subject: "Account activation")

    #mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
end
