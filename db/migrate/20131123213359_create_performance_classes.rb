class CreatePerformanceClasses < ActiveRecord::Migration
  def change
    create_table :performance_classes do |t|
      t.string :title
      t.integer :age_min
      t.integer :age_max
      t.integer :win_min
      t.integer :win_max
      t.boolean :gender

      t.timestamps
    end
  end
end
