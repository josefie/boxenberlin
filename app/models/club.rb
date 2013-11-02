class Club < ActiveRecord::Base
  has_many :events
  has_many :trainings, :dependent => :destroy
  has_many :boxers, :dependent => :destroy
  has_many :coaches, :dependent => :destroy
  
  accepts_nested_attributes_for :coaches, allow_destroy: true, reject_if: proc { |a| a['first_name'].blank? and a['last_name'].blank? }
  accepts_nested_attributes_for :trainings, allow_destroy: true, reject_if: proc { |a| a['weekday'].blank? }
  
  validates :name, presence: true
  
  has_secure_password
  validates :password, presence: true, :on => :create

  def admin?
    false
    if self.id == 0
      true
    end
  end
  
end
