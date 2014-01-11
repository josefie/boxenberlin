class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_mail
      t.text :additional_info
      t.decimal :admission
      t.decimal :admission_discounted
      t.decimal :fee
      t.boolean :approved
      t.timestamps
    end
  end
end
