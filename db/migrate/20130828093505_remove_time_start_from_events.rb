class RemoveTimeStartFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :time_start, :time
  end
end
