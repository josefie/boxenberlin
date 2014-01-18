class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.boolean :approved
      t.integer :event_id
      t.integer :opponent_red
      t.integer :opponent_blue
      t.integer :priority

      t.timestamps
    end
  end
end
