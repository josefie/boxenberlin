class RemoveTimeFieldsFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :time_start
    remove_column :events, :time_doctor
    remove_column :events, :time_weighing
  end
  
  def down
    add_column :events, :time_start, :time
    add_column :events, :time_doctor, :time
    add_column :events, :time_weighing, :time
  end
end
