class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
