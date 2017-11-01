class CreateTextTags < ActiveRecord::Migration[5.1]
  def change
    create_table :text_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
