class PerformanceClass < ActiveRecord::Base
  #self.abstract_class = true
  has_and_belongs_to_many :events
  has_many :boxers
  
  #has_many :weight_classes
  #accepts_nested_attributes_for :weight_classes
  
end
