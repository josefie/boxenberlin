class Club < ActiveRecord::Base
  has_many :events
  #has_many :trainings
  #has_many :members
  #serialize :coaches
  
  validates :name, presence: true
end
