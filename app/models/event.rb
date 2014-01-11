class Event < ActiveRecord::Base
  geocoded_by :loc
  after_validation :geocode, if: ->(obj){ location_change(obj) and !Rails.env.test? }
  
  validates :club_id, presence: true
  #validates :location, presence: true
  validates :date, presence: true
  validates :title, presence: true
  #validate :at_least_one_schedule_item
  validate :deadline_before_date
  
  belongs_to :club, :foreign_key => 'club_id'
  has_and_belongs_to_many :performance_classes
  has_many :schedule_items
  has_many :participations
  has_many :boxers, -> { distinct }, through: :participations
  has_one :location, :dependent => :nullify
  
  accepts_nested_attributes_for :schedule_items, allow_destroy: true, reject_if: proc { |a| a['label'].blank? }
  accepts_nested_attributes_for :location, allow_destroy: true#, reject_if: proc { |a| a['city'].blank? }
  
  def at_least_one_schedule_item
    if self.schedule_items.empty?
      errors[:base] << ("Es muss mindestens ein Starttermin angegeben werden.")
    end
  end
  
  def deadline_before_date
    unless self.deadline.nil?
      if self.deadline > self.date
        errors[:base] << ("Die Anmeldefrist darf nicht nach dem Veranstaltungstag (#{I18n.localize self.date}) liegen.")
      end
    end
  end
  
  def self.search(search)
    club_id = 0
    club = Club.where("name LIKE ?", "%#{search}%")
    if !club.take.nil?
      club_id = club.take.id
    end
    
    Event.where('title LIKE ? OR contact_name LIKE ? OR club_id = ?', "%#{search}%", "%#{search}%", club_id)
  end
  
  def self.find_upcoming
    today = Date.today
    Event.where('date >= ?', today)
  end
  
  def self.find_past
    today = Date.today
    Event.where('date < ?', today)
  end
  
  def self.by_date(date)
    Event.where("strftime('%m', date) + 0 = ? AND strftime('%Y', date) + 0 = ?", date.month, date.year)
  end
  
  def upcoming?
    self.date >= Date.today
  end
  
  def get_deadline
    unless self.deadline.nil?
      self.deadline
    else
      self.date - 1.day
    end
  end
  
  def loc
    [self.location.street, self.location.number, self.location.zip, self.location.city, self.location.country].compact.join(' ')
  end
  
  def location_change(obj)
    if obj.location.nil?
      return false
    else
      ( obj.location.street.present? or obj.location.number.present? or obj.location.zip.present? or obj.location.city.present? ) and ( obj.location.street_changed? or obj.location.number_changed? or obj.location.zip_changed? or obj.location.city_changed? )
    end
  end
  
end
