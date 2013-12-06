class AddWeekdayToTraining < ActiveRecord::Migration
  def up
    add_column :trainings, :weekday_id, :integer
    remove_column :trainings, :weekday
  end
  
  def down
    remove_column :trainings, :weekday_id
    add_column :trainings, :weekday, :integer
  end
end
