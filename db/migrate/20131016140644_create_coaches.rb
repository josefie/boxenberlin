class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.integer :club_id

      t.timestamps
    end
  end
end
