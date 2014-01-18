class CreateEventsBoxers < ActiveRecord::Migration
  def change
    create_join_table :events, :boxers do |t|
      t.index :event_id
      t.index :boxer_id
    end
  end
end
