class RenamePublicInDreamsAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :dreams, :public, :is_public
  end
end
