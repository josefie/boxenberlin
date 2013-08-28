class AddPublicColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :contact_name_public, :boolean
    add_column :events, :contact_phone_public, :boolean
    add_column :events, :contact_mail_public, :boolean
  end
end
