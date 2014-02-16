class Fight < ActiveRecord::Base
  belongs_to :event, :foreign_key => 'event_id'
  belongs_to :opponent_red, :class_name => 'Boxer', :foreign_key => 'opponent_red'
  belongs_to :opponent_blue, :class_name => 'Boxer', :foreign_key => 'opponent_blue'
end

public
def prioritize
  pd = get_performance_distance
  wd = get_weight_distance
  ad = get_age_distance.abs
  
  # ignore age_distance and weight_distance if less than 2
  if ad <= 2 then ad = 0 end
  if wd.abs <= 2 then wd = 0 end
    
  # greater weight_distance -> lower priority
  self.priority = (pd + wd).abs
end

def get_performance_distance
  self.opponent_red.get_performance_value - self.opponent_blue.get_performance_value
end

def get_weight_distance
  self.opponent_red.weight - self.opponent_blue.weight
end

def get_age_distance
  self.opponent_red.get_age - self.opponent_blue.get_age
end

def get_age_class
  age_class = nil
  unless self.opponent_red.get_age_class.nil?
    age_red = self.opponent_red.get_age_class
    unless self.opponent_blue.get_age_class.nil?
      age_blue = self.opponent_blue.get_age_class
      age_class = (age_red.id > age_blue.id) ? age_red : age_blue
    else
      age_class = age_red
    end
  end
  return age_class
end

def get_performance_class
  performance_class = nil
  unless self.opponent_red.get_performance_class.nil?
    performance_red = self.opponent_red.get_performance_class
    unless self.opponent_blue.get_performance_class.nil?
      performance_blue = self.opponent_blue.get_performance_class
      performance_class = (performance_red.id > performance_blue.id) ? performance_red : performance_blue
    else
      performance_class = performance_red
    end
  end
  return performance_class
end

def get_weight_class
  
end