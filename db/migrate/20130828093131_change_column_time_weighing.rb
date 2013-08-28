class ChangeColumnTimeWeighing < ActiveRecord::Migration
  def change
    change_column :events, :time_weighing, :time
  end
end
