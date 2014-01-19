class Fight < ActiveRecord::Base
  belongs_to :event, :foreign_key => 'event_id'
  belongs_to :opponent_red, :class_name => 'Boxer', :foreign_key => 'opponent_red'
  belongs_to :opponent_blue, :class_name => 'Boxer', :foreign_key => 'opponent_blue'
end

public
def prioritize
  self.priority = (opponent_red.get_performance_value - opponent_blue.get_performance_value).abs
  # todo: other stuff that influences the fights priority, e.g.
    # opponents are from the same club -> lower
    # same opponent twice -> lower
    # greater age_distance or weight_distance -> lower
end