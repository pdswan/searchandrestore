class Venue < ActiveRecord::Base
  default_scope order("#{quoted_table_name}.name asc")

  mount_uploader :image, VenueImageUploader

  has_many :shows
  has_many :videos, :through => :shows

  validates :name, 
            :address, 
            :their_words,
            :our_words, 
            :latitude,
            :longitude, :presence => true

  geocoded_by :address do |obj, results|
    if result = results.first
      obj.city      = result.city
      obj.latitude  = result.latitude
      obj.longitude = result.longitude
    end
  end

  before_validation :geocode, :if => proc { |record| record.new_record? || record.address_changed? }
end
