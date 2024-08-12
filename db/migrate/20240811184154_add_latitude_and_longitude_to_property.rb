class AddLatitudeAndLongitudeToProperty < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :latitude, :decimal, default: 0
    add_column :properties, :longitude, :decimal, default: 0
  end
end
