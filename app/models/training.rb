class Training < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  has_and_belongs_to_many :coaches
  belongs_to :weekday, :foreign_key => 'weekday_id'
end
