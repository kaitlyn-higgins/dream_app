class CreateDreams < ActiveRecord::Migration[5.2]
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image_url

      t.timestamps
    end
  end
end
