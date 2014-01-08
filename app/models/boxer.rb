class Boxer < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  
  has_many :participations
  has_many :events, -> { distinct }, through: :participations
  
  validates :fights_won, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_lost, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_drawn, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :date_of_birth, presence: true  
  validate :at_least_one_name

  def at_least_one_name
    if self.first_name.blank? && self.last_name.blank?
      errors[:base] << ("Bitte geben Sie einen Namen ein.")
    end
  end

  def classify_age
    age = (Date.today.to_s.to_i - self.date_of_birth.to_s.to_i)
    gender = self.gender

    ac = PerformanceClass.where('age_min <= ? AND age_max >= ? AND gender = ?', age, age, gender).first
    unless ac.nil? then
      ac.title
    else 
      "Nicht klassifiziert"
    end
  end
  
  def classify_performance
    fights_won = self.fights_won
    age = (Date.today.to_s.to_i - self.date_of_birth.to_s.to_i)
    
    pc = PerformanceClass.where('win_min <= ? AND win_max >= ? AND age_min <= ? AND age_max >= ?', fights_won, fights_won, age, age).first
    unless pc.nil? then
      pc.title
    else 
      "Nicht klassifiziert"
    end
  end
  
end
