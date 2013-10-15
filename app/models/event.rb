class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates :title, presence: true
  validates :address, presence: true
  validates :club_id, presence: true
  
  belongs_to :club, :foreign_key => 'club_id'
  
  
  def self.search(search)
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end
  
  def self.find_upcoming
    today = Date.today
    find(:all, :conditions => ['date >= ?', today])
  end
  
  def self.find_past
    today = Date.today
    find(:all, :conditions => ['date < ?', today])
  end
  
  def self.by_date(date)
    find(:all, :conditions => ["strftime('%m', date) + 0 = ? AND strftime('%Y', date) + 0 = ?", date.month, date.year])
  end
  
end
