class CreateScheduleItems < ActiveRecord::Migration
  def change
    create_table :schedule_items do |t|
      t.string :label
      t.time :time
      t.integer :event_id

      t.timestamps
    end
  end
end
