class ChangeColumnTimeStart < ActiveRecord::Migration
  def change
    change_column :events, :time_start, :time
  end
end
