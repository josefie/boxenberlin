class Boxer < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  
  has_many :participations
  has_and_belongs_to_many :events
  has_many :fights
  
  validates :fights_won, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_lost, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_drawn, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validate :at_least_one_name
  validates :date_of_birth, presence: true  
  validates :weight, presence: true
  validates :fights_won, presence: true
  validates :fights_lost, presence: true
  validates :fights_drawn, presence: true
  validates :gender, :inclusion => {:in => [true, false]}

  def at_least_one_name
    if self.first_name.blank? && self.last_name.blank?
      errors[:base] << ("Bitte geben Sie einen Namen ein.")
    end
  end
  
  def get_name
    self.first_name + ' ' + self.last_name
  end
  
  def get_age
    Date.today.to_s.to_i - self.date_of_birth.to_s.to_i
  end

  def get_performance_class
    fights_won = self.fights_won
    age = get_age
    
    PerformanceClass.where('win_min <= ? AND win_max >= ? AND age_min <= ? AND age_max >= ?', fights_won, fights_won, age, age).last    
  end
  
  def get_age_class
    age = get_age
    gender = self.gender

    PerformanceClass.where('age_min <= ? AND age_max >= ? AND gender = ?', age, age, gender).first
  end
  
  def get_performance_value
    (self.fights_won * 5) + (self.fights_lost * 1) + (self.fights_drawn * 2)
  end
  
  def number_of_fights
    (self.fights_won + self.fights_lost + self.fights_drawn)
  end
  
end
