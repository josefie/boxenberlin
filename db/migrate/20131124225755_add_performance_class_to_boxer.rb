class AddPerformanceClassToBoxer < ActiveRecord::Migration
  def change
    add_column :boxers, :performance_class_id, :integer
  end
end
