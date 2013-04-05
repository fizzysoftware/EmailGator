class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :heading
      t.string :source
      t.string :content
      t.string :email_text
      t.string :button_text
      t.string :background_color

      t.timestamps
    end
  end
end
