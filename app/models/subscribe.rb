class Subscribe < ActiveRecord::Base
  attr_accessible :heading
  belongs_to :user
end
