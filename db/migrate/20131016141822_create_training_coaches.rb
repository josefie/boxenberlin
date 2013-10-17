class CreateTrainingCoaches < ActiveRecord::Migration
  def change
    create_join_table :trainings, :coaches do |t|
      t.index :training_id
      t.index :coach_id
    end
  end
end
