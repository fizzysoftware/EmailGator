class AddUserToSubscribe < ActiveRecord::Migration
  def change
  	add_column :subscribes, :user_id, :integer
  end
end