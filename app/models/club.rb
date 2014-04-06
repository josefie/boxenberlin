class Club < ActiveRecord::Base
  has_many :events, :dependent => :destroy
  has_many :boxers, :dependent => :destroy
  has_many :trainings, :dependent => :destroy
  has_many :coaches, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  
  accepts_nested_attributes_for :coaches, allow_destroy: true, reject_if: proc { |a| a['first_name'].blank? and a['last_name'].blank? }
  accepts_nested_attributes_for :trainings, allow_destroy: true, reject_if: proc { |a| a['weekday_id'].blank? }
  accepts_nested_attributes_for :locations, allow_destroy: true, reject_if: proc { |a| a['city'].blank? }
  
  validates :name, presence: true
  validates :contact_mail, presence: true
  validates :contact_mail, uniqueness: true
  validates :contact_mail, email: true
  
  has_secure_password
  validates :password, presence: true, :on => :create
  
  before_validation :format_url
  validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_blank => true

  def admin?
    false
    if self.id == 1
      true
    end
  end
  
  def get_hosting_events
    today = Date.today
    Event.where('club_id = ? AND date >= ?', self.id, today)
  end
  
  def get_participating_events
    #Event.joins(:boxers).where(boxers: { id: [self.boxers.ids] }).group(:date)
    #Event.joins(:boxers).where(boxers: { id: [self.boxers.ids] }).group(:id)
    
    Event.includes(:boxers).where(boxers: {id: [self.boxers.ids]})
  end
  
  def get_past_events
    Event.find_past.where(:club_id => self.id)
  end
  
  def format_url
    self.website = "http://#{self.website}" unless self.website.nil? || self.website[/^https?/] || self.website.blank?
  end
  
end
