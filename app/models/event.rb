class Event < ActiveRecord::Base

  validates :club_id, presence: true
  validates :date, presence: true
  validates :title, presence: true
  #validate :at_least_one_schedule_item
  validate :deadline_before_date
  
  belongs_to :club, :foreign_key => 'club_id'
  has_and_belongs_to_many :performance_classes
  has_many :schedule_items
  has_and_belongs_to_many :boxers
  has_one :location, :dependent => :nullify
  has_many :fights
  has_many :matching_stats, -> { distinct }
  
  accepts_nested_attributes_for :schedule_items, allow_destroy: true, reject_if: proc { |a| a['label'].blank? }
  accepts_nested_attributes_for :location, allow_destroy: true#, reject_if: :all_blank
  
  def at_least_one_schedule_item
    if self.schedule_items.blank?
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
  
  def apply(boxer)
    self.boxers << boxer
  end

  def generate_fights(boxers, age_distance, weight_distance, same_club, championship, algorithm)    
    fights = Array.new
    
    # filtern nach kriterien
    unless championship
      fights = filter(boxers, age_distance, weight_distance, same_club)
    else
      fights = filter_cs(boxers)
    end

    # matching
    if algorithm == 1 then
      fights = maximal_inclusion_matching(fights)
    elsif algorithm == 2 then
      fights = maximum_weight_matching(fights)
    else
      fights = maximum_cardinality_matching(fights)
    end
    
    fights.each do |f|
      f.save
    end
    return fights
  end
  
  def filter_cs(participants)
    number_of_participants = participants.count
    possible_fights = Array.new
    # iterate through all edges/fights
    n = 0
    while(n < number_of_participants) do
      m = n + 1
      while(m < number_of_participants) do
        red = participants[n]
        blue = participants[m]
        if(
          red.gender == blue.gender and 
          red.get_age_class == blue.get_age_class and
          #red.get_weight_class == blue.get_weight_class and
          (red.weight - blue.weight).abs <= 2 and # todo: replace with weight class
          red.get_performance_class == blue.get_performance_class and
          red.club_id != blue.club_id
          )
          fight = Fight.new(:opponent_red => red, :opponent_blue => blue, :event_id => self.id, :approved => false)
          unless fight.nil?
            fight.prioritize
            possible_fights << fight
          end
        end
        m = m+1
      end
      n = n+1
    end
    return possible_fights
  end
  
  def filter(participants, age_distance, weight_distance, same_club)
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
          (red.weight - blue.weight).abs <= weight_distance
          )
          if same_club
            fight = Fight.new(:opponent_red => red, :opponent_blue => blue, :event_id => self.id, :approved => false)
          else
            if(red.club_id != blue.club_id)
              fight = Fight.new(:opponent_red => red, :opponent_blue => blue, :event_id => self.id, :approved => false)
            end
          end
          unless fight.nil?
            fight.prioritize
            possible_fights << fight
          end
        end
        m = m+1
      end
      n = n+1
    end
    return possible_fights
  end

  def maximal_inclusion_matching(graph)
    # greedy algorithmus
    matching = Array.new
    while !graph.empty? do
      k = graph.shift
      matching << k
      graph.reject! {|fight| [fight.opponent_red, fight.opponent_blue].include?(k.opponent_red) || [fight.opponent_red, fight.opponent_blue].include?(k.opponent_blue) }
    end
    return matching
  end

  def maximum_weight_matching(graph)
    # maximum weight algorithmus
    graph.sort! { |a,b| a.priority <=> b.priority }
    return maximal_inclusion_matching(graph).reject{ |f| f.priority > 99 }
  end
  
  def maximum_cardinality_matching(graph)
    # maximum cardinality algorithmus
    return graph
  end
  
  def calc_stat(matching)
    @matching_value = 0
    @percentage_matched = 0
    matched_opponents = Array.new
    matching.each do |f|
      @matching_value += f.priority
      b1 = f.opponent_red
      b2 = f.opponent_blue
      unless (matched_opponents.include?(b1)) then matched_opponents << b1 end
      unless (matched_opponents.include?(b2)) then matched_opponents << b2 end
    end
    
    stat = MatchingStat.new
    unless matching.empty?
      @matching_value /= matching.count
      @percentage_matched = ((matched_opponents.count.to_f / self.boxers.count.to_f) * 100).to_i
      
      # save matching statistics
      stat.matching_value = @matching_value
      stat.percentage_matched = @percentage_matched
      stat.event_id = self.id
      stat.save
      
    end
    return stat
  end
  
end
