class AddLatitudeAndLongitudeToEvents < ActiveRecord::Migration
  def up
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
  end
  def down
    remove_column :events, :latitude
    remove_column :events, :longitude
  end
end
