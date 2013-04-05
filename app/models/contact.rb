class Contact < ActiveRecord::Base
  attr_accessible :email, :user_id

  validates :email, :presence => true

  belongs_to :user
end
