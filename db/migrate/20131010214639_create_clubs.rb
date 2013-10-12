class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :street
      t.integer :street_no
      t.string :zip
      t.string :city
      t.string :website
      t.text :coaches
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_mail

      t.timestamps
    end
  end
end
