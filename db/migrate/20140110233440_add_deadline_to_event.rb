class AddDeadlineToEvent < ActiveRecord::Migration
  def up
    add_column :events, :deadline, :date
  end
  
  def down
    remove_column :events, :deadline
  end
end
