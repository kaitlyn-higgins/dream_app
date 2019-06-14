class AddPublicToDreams < ActiveRecord::Migration[5.2]
  def change
    add_column :dreams, :public?, :boolean, default: true
  end
end
