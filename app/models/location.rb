class Location < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  belongs_to :event, :foreign_key => 'event_id'

  #geocoded_by :address
  #after_validation :geocode, :if => :address_changed?

  def address
    [self.street, self.number, self.zip, self.city, self.country].compact.join(' ')
  end
  
  def address_changed?
    ( self.street.present? or self.number.present? or self.zip.present? or self.city.present? ) and ( self.street_changed? or self.number_changed? or self.zip_changed? or self.city_changed? )
  end

end