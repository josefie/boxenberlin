class Participation < ActiveRecord::Base
  belongs_to :event
  belongs_to :boxer
  
  validates :event_id, :uniqueness => {:scope => :boxer_id}
end
