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

  def self.for_day(day_or_date_string)
    unless day_or_date_string.respond_to?(:beginning_of_day)
      day_or_date_string = Time.zone.parse(day_or_date_string)
    end
    where(:when => (day_or_date_string.beginning_of_day..day_or_date_string.end_of_day))
  end
  scope :upcoming,  where(self.arel_table[:when].gt(Time.zone.now)).order(:when => 'asc')
  scope :today,     for_day(Time.zone.now)
  scope :not_today, where(self.arel_table[:when].not_in(Time.zone.now.beginning_of_day..Time.zone.now.end_of_day))

  def self.search_and_restore(bool = true)
    where(:search_and_restore => !!bool)
  end

  def self.featured(bool = true)
    where(:featured => !!bool)
  end

  search_methods :for_day

  def when
    read_attribute(:when).try(:in_time_zone) || Time.zone.now
  end

  def name
    "#{group_name} @ #{venue.name} - #{self.when.strftime("%m/%d/%y")}"
  end
end
