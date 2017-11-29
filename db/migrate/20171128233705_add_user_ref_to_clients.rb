class AddUserRefToClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :user_id, :integer
    add_reference :clients, :user, foreign_key: true
  end
end
