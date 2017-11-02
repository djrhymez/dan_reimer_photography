class RemoveProductIdFromProductTextTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_text_tags, :product_id_id, :reference
  end
end
