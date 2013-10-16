class CreateTrainingCoaches < ActiveRecord::Migration
  def change
    create_table :training_coaches do |t|
      t.references :training, index: true
      t.references :coach, index: true

      t.timestamps
    end
  end
end
