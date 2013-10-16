class Coach < ActiveRecord::Base
  belongs_to :club, :foreign_key => 'club_id'
  has_and_belongs_to_many :trainings
end
