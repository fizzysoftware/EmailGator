class Notifier < ActionMailer::Base
  default :from => "support@mailgator.com"

  def welcome(recipient,random_password = "")
    @recipient = recipient
    @random_password = random_password
    mail(:to => @recipient.email, :subject => "Welcome to MailGator")  
  end
   
  def we_are_missing_you(recipient)
    @recipient = recipient
    mail(:to => recipient.email, :subject => "We are missing you :)")
  end 

  def send_message(message,contact)
    headers['X-SMTPAPI'] = '{"category":"'+ message.category+'" }'
    @body = message.body
    mail(:from => message.user.email, :to => contact, :subject => message.subject)
  end

  def contact_us(contact_us)
    @contact_us = contact_us
    mail(:from => contact_us.email ,:to => 'nikhilkath@gmail.com' , :subject => "MailGator - Contact Form")
  end
end
