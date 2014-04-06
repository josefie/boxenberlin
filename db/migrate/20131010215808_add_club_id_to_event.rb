class AddClubIdToEvent < ActiveRecord::Migration
  def up
    add_column :events, :club_id, :integer
  end
  def down
    remove_column :events, :club_id
  end
end
