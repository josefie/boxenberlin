class CreateBoxers < ActiveRecord::Migration
  def change
    create_table :boxers do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.float :weight
      t.integer :fights_won
      t.integer :fights_lost
      t.integer :fights_drawn
      t.boolean :gender
      t.boolean :active
      t.integer :club_id

      t.timestamps
    end
  end
end
