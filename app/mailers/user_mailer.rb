require 'aws-sdk-ses'

class UserMailer < ApplicationMailer
  default from: 'talmadgebearauto@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
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
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end



  #Testing code below
  def signup_email
    @user = params[:user]
    receiver = @user.email
    sender = "support@ici.com"
    subject = "Welcome email"

    # The HTML body of the email
    htmlbody = render_to_string(:partial =>   'user_mailer/email_template.html.erb', :layout => false, :locals => {:user => @user})

    # send email
    send_email(receiver, sender, subject, htmlbody)
  end
def send_email(receiver, sender, subject, htmlbody)
   region = "us-east-1"

   # Specify the text encoding scheme.
   encoding = "UTF-8"
   # configure SES session
   ses = Aws::SES::Client.new(
      region: us-east-2,
      access_key_id: "AKIA5FCJZNEBCXZLBQHO",
     secret_access_key: "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"
)

   begin
      ses.send_email({
         destination: {
            to_addresses: [
               receiver,
            ],
            },
         message: {
            body: {
               html: {
               charset: encoding,
               data: htmlbody,
              }
            },
         subject: {
            charset: encoding,
            data: subject,
         },
         },
         source: sender,
         })
      puts "Email sent!"
   rescue Aws::SES::Errors::ServiceError => error
        puts "Email not sent. Error message: #{error}"
   end
end


end
