class Boxer < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  belongs_to :performance_class, :foreign_key => 'performance_class_id'
  
  validates :fights_won, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_lost, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :fights_drawn, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  
  def classify
    age = (Date.today.to_s.to_i - self.date_of_birth.to_s.to_i) # ??
    weight = self.weight
    gender = self.gender
    
    self.performance_class = PerformanceClass.where(
      'age_min <= ? AND age_max >= ? AND gender = ?', age, age, gender).first
    # self.performance_class = PerformanceClass.where('age_min <= ? AND age_max >= ? AND gender = ? AND weight_min <= ? AND weight_max >= ?', age, age, gender, weight, weight).first
  end
  
  def classify_weight
    age = Date.today - self.date_of_birth
    weight = self.weight
    gender = self.gender
    
    WeightClass.where()
    
    if age >= 6 && age < 15 then # Schüler und Kadetten
      
    elsif age >= 15 && age < 17 then # Junioren
      
    elsif age >= 17 then # Jugend und Männer/Frauen
      
    end
  end
  
end
