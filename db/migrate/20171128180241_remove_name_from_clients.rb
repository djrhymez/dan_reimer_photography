class RemoveNameFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :name, :string
    remove_column :clients, :password, :string
    remove_column :clients, :email, :string
    add_column :clients, :address, :string
    add_column :clients, :user_id, :integer
  end
end
