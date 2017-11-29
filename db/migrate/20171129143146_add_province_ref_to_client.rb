class AddProvinceRefToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :province, foreign_key: true
  end
end
