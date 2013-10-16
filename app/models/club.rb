class Club < ActiveRecord::Base
  has_many :events
  has_many :trainings, :dependent => :destroy
  has_many :boxers, :dependent => :destroy
  has_many :coaches, :dependent => :destroy
  
  accepts_nested_attributes_for :coaches, :allow_destroy => true, :reject_if => lambda { |a| a[:first_name].blank? and a[:last_name].blank? }
  
  validates :name, presence: true
end
