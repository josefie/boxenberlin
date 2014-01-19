class CreateMatchingStats < ActiveRecord::Migration
  def change
    create_table :matching_stats do |t|
      t.integer :matching_value
      t.integer :percentage_matched
      t.integer :event_id
      
      t.timestamps
    end
  end
end
