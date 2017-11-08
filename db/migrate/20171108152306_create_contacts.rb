class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :phone
      t.string :email
      t.string :instagram_handle
      t.string :facebook_page
      t.string :twitter_handle
      t.text :welcome_message

      t.timestamps
    end
  end
end
