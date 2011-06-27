class Show < ActiveRecord::Base
  belongs_to :venue

  has_many :performances
  has_many :artists, :through => :performances

  accepts_nested_attributes_for :performances, 
                                :reject_if => proc { |attributes| attributes[:artist_id].blank? &&
                                  (!attributes.has_key?(:artist_attributes) || attributes[:artist_attributes][:name].blank?) }

  validates :venue,
            :group_name,
            :when,
            :description,
            :presence => true

  def when
    read_attribute(:when) || Time.zone.now
  end
end
