class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  validates :title, presence: true
  validates :address, presence: true
  validates :date, presence: true
  #validate :at_least_one_schedule_item
  validates :contact_name, presence: true
  validates :contact_mail, presence: true
  validates :club_id, presence: true
  
  belongs_to :club, :foreign_key => 'club_id'
  has_and_belongs_to_many :performance_classes
  has_many :schedule_items
  has_many :participations
  has_many :boxers, -> { distinct }, through: :participations
  
  accepts_nested_attributes_for :schedule_items, allow_destroy: true, reject_if: proc { |a| a['label'].blank? }
  
  def at_least_one_schedule_item
    if self.schedule_items.empty?
      errors[:base] << ("Es muss mindestens ein Starttermin angegeben werden.")
    end
  end
  
  def self.search(search)
    club_id = 0
    club = Club.where("name LIKE ?", "%#{search}%")
    if !club.take.nil?
      club_id = club.take.id
    end
    
    #find(:all, :conditions => ['title LIKE ? OR contact_name LIKE ? OR club_id = ?', "%#{search}%", "%#{search}%", club_id])
    Event.where('title LIKE ? OR contact_name LIKE ? OR club_id = ?', "%#{search}%", "%#{search}%", club_id)
  end
  
  def self.find_upcoming
    today = Date.today
    #find(:all, :conditions => ['date >= ?', today])
    Event.where('date >= ?', today)
  end
  
  def self.find_past
    today = Date.today
    #find(:all, :conditions => ['date < ?', today])
    Event.where('date < ?', today)
  end
  
  def self.by_date(date)
    #find(:all, :conditions => ["strftime('%m', date) + 0 = ? AND strftime('%Y', date) + 0 = ?", date.month, date.year])
    Event.where("strftime('%m', date) + 0 = ? AND strftime('%Y', date) + 0 = ?", date.month, date.year)
  end
  
end
