class CreatePerformanceClasses < ActiveRecord::Migration
  def change
    create_table :performance_classes do |t|
      t.string :title
      t.integer :age_min
      t.integer :age_max
      t.integer :weight_min
      t.integer :weight_max
      t.boolean :gender

      t.timestamps
    end
  end
end
