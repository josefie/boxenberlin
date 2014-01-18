class Fight < ActiveRecord::Base
  belongs_to :event, :foreign_key => 'event_id'
  belongs_to :opponent_red, :class_name => 'Boxer', :foreign_key => 'opponent_red'
  belongs_to :opponent_blue, :class_name => 'Boxer', :foreign_key => 'opponent_blue'
end
