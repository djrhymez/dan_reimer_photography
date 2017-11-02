class RemoveCategoryFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :category, :text
  end
end
