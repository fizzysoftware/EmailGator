class AddColumnsToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :recipients, :integer, :default => 0
  	add_column :messages, :opens, :integer, :default => 0
  	add_column :messages, :unique_opens, :integer, :default => 0
  	add_column :messages, :clicks, :integer, :default => 0
  	add_column :messages, :unique_clicks, :integer, :default => 0
  	add_column :messages, :bounces, :integer, :default => 0
  end
end
