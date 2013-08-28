class ChangeColumnTimeDoctor < ActiveRecord::Migration
  def change
    change_column :events, :time_doctor, :time
  end
end
