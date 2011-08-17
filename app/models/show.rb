class Show < ActiveRecord::Base
  default_scope :include => :venue

  belongs_to :venue

  has_many :performances, :dependent => :destroy
  has_many :artists,      :through => :performances
  has_many :videos,       :dependent => :destroy

  accepts_nested_attributes_for :performances, 
                                :reject_if => proc { |attributes| attributes[:artist_id].blank? &&
                                  (!attributes.has_key?(:artist_attributes) || attributes[:artist_attributes][:name].blank?) },
                                :allow_destroy => true

  accepts_nested_attributes_for :videos,
                                :allow_destroy => true,
                                :reject_if => proc { |attributes| attributes[:url].blank? }

  validates :venue,
            :group_name,
            :when,
            :presence => true

  def when
    read_attribute(:when) || Time.zone.now
  end

  def name
    "#{group_name} @ #{venue.name} - #{self.when.strftime("%m/%d/%y")}"
  end
end
