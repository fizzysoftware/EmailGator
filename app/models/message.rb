class Message < ActiveRecord::Base
  attr_accessible :body, :subject, :user_id

  validates :subject, :body, :presence => true

  belongs_to :user

  define_index do
  	indexes content
  	indexes :subject, sortable: true
  	indexes :body 		
  end

  def send_mail(user)
  	self.category = 'mail_'+Random.rand(2**256).to_s(36)[0..7]
  	self.recipients = user.contacts.count
    self.save
    user.contacts.each do |contact|
      Notifier.delay.send_message(self, contact.email)
    end
  end

  def mail_statistics(data)
  	self.opens = data.first['opens']
  	self.unique_opens = data.first['unique_opens']
  	self.clicks = data.first['clicks']
  	self.unique_clicks = data.first['unique_clicks']
  	self.bounces = data.first['repeat_bounces']
  	self.save
  end

end
