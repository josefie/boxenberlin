class Club < ActiveRecord::Base
  has_many :events
  has_many :trainings, :dependent => :destroy
  has_many :boxers, :dependent => :destroy
  has_many :coaches, :dependent => :destroy
  
  accepts_nested_attributes_for :coaches, allow_destroy: true, reject_if: proc { |a| a['first_name'].blank? and a['last_name'].blank? }
  accepts_nested_attributes_for :trainings, allow_destroy: true, reject_if: proc { |a| a['weekday'].blank? }
  
  validates :name, presence: true
  
  
  #arams = { club: { name: 'joe', coaches_attributes: [{ first_name: 'Test', last_name: 'Test' }] }}
  #club = Club.create(params[:club])

end
