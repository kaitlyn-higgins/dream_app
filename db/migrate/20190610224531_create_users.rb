class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.integer :zip_code
      t.string :username
      t.string :gender
      t.string :password_digest

      t.timestamps
    end
  end
end
