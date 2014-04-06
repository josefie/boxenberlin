class AddPublicColumnsToEvents < ActiveRecord::Migration  
  def up
    add_column :events, :contact_name_public, :boolean
    add_column :events, :contact_phone_public, :boolean
    add_column :events, :contact_mail_public, :boolean
  end
  
  def down
    remove_column :events, :contact_name_public
    remove_column :events, :contact_phone_public
    remove_column :events, :contact_mail_public
  end
end
