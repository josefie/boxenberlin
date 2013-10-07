class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates :title, presence: true
  validates :address, presence: true
end
