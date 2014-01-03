class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.integer :club_id
      t.integer :event_id

      t.timestamps
    end
  end
end
