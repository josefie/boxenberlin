class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.integer :weekday
      t.datetime :time_start
      t.datetime :time_end
      t.text :description
      t.integer :club_id

      t.timestamps
    end
  end
end
