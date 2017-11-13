class CreateAboutPages < ActiveRecord::Migration[5.1]
  def change
    create_table :about_pages do |t|
      t.string :header
      t.text :message

      t.timestamps
    end
  end
end
