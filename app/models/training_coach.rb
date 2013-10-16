class TrainingCoach < ActiveRecord::Base
  belongs_to :training
  belongs_to :coach
end
