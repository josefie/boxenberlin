class Boxer < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  belongs_to :performance_class, :foreign_key => 'performance_class_id'
  
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

  def classify
    age = (Date.today.to_s.to_i - self.date_of_birth.to_s.to_i)
    weight = self.weight
    gender = self.gender
    
    self.performance_class = PerformanceClass.where(
      'age_min <= ? AND age_max >= ? AND gender = ?', age, age, gender).first

    # self.performance_class = PerformanceClass.where('age_min <= ? AND age_max >= ? AND gender = ? AND weight_min <= ? AND weight_max >= ?', age, age, gender, weight, weight).first
  end
  
end
