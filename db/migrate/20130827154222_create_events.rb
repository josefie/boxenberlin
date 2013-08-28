class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.datetime :time_start
      t.datetime :time_weighing
      t.datetime :time_doctor
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_mail
      t.text :additional_info
      t.boolean :gloves_available
      t.boolean :catering_available
      t.decimal :admission
      t.decimal :admission_discounted

      t.timestamps
    end
  end
end
