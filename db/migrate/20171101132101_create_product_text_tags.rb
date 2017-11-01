class CreateProductTextTags < ActiveRecord::Migration[5.1]
  def change
    create_table :product_text_tags do |t|
      t.integer :product_ID
      t.integer :text_tag_ID

      t.timestamps
    end
  end
end
