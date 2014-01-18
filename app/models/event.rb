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
  has_and_belongs_to_many :boxers
  has_one :location, :dependent => :nullify
  has_many :fights
  
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
  
  def generate_fights
    fight_list = Array.new
    participants = Array.new(self.boxers)
    participants.each do |boxer|
      b1 = participants.pop
      b2 = participants.pop
      fight = self.fights.build(:opponent_red => b1, :opponent_blue => b2, :event_id => self.id, :approved => false)
      unless fight.nil?
        fight_list << fight
      end
    end
    fight_list
  end

  def match(age_distance, weight_distance, same_club, algorithm)
    participants = self.boxers
    number_of_participants = participants.count
    possible_fights = Array.new
    # iterate through all edges/fights
    n = 0
    while(n < number_of_participants) do
      m = n + 1
      while(m < number_of_participants) do
        red = participants[n]
        blue = participants[m]
        if(red.get_age >= 18 and blue.get_age >= 18) # only limit age distance for non-adults
          age_dist = 20 
        else
          age_dist = age_distance
        end
        if(
          red.gender == blue.gender and 
          (red.get_age - blue.get_age).abs <= age_dist and
          #red.get_age_class == blue.get_age_class and
          (red.weight - blue.weight).abs <= weight_distance #and
          #red.get_performance_class == blue.get_performance_class
          )
          value = (red.get_value - blue.get_value).abs
          fight = Fight.new(:opponent_red => red, :opponent_blue => blue, :event_id => self.id, :approved => false, :priority => value)
          unless fight.nil?
            possible_fights << fight
          end
        end
        m = m+1
      end
      n = n+1
    end

    if algorithm == 1 then
      self.fights = possible_fights
      maximal_matching(possible_fights)
    elsif algorithm == 2 then
      maximum_weight_matching(possible_fights)
    else
      return possible_fights
    end
  end

  def maximal_matching(graph)
    # greedy algorithmus
    return graph
  end

  def maximum_weight_matching(graph)
    # maximum weight alorithmus
   return graph
  end
  
end
