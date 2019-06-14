class RenamePublicInDreams < ActiveRecord::Migration[5.2]
  def change
    rename_column :dreams, :public?, :public
  end
end
