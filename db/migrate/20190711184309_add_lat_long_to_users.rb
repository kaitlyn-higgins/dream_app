class AddLatLongToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :latitude, :decimal, precision: 10, scale: 5
    add_column :users, :longitude, :decimal, precision: 10, scale: 5
  end
end
