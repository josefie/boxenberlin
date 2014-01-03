class Location < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  belongs_to :event, :foreign_key => 'event_id'
end
