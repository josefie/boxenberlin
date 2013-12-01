class CreateEventsPerformanceClasses < ActiveRecord::Migration
  def change
    create_join_table :events, :performance_classes do |t|
      t.index :event_id
      t.index :performance_class_id
    end
  end
end
