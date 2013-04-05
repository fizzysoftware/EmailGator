class ContactU < ActiveRecord::Base
  attr_accessible :comment, :email, :name, :phone_number, :subject

  validates_presence_of :name,:email,:subject, :comment
  validates_format_of :email,
  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
  :unless => lambda{ |a| a.email.blank? }
  
  after_create :send_mail

  def send_mail
     Notifier.contact_us(self).deliver
  end

end