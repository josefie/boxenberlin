class RemoveCoachesFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :coaches, :text
  end
end
