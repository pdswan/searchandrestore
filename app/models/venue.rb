class Venue < ActiveRecord::Base
  validates :name, 
            :address, 
            :their_words,
            :our_words, 
            :latitude,
            :longitude, :presence => true

  geocoded_by :address

  before_validation :geocode, :if => proc { |record| record.new_record? || record.address_changed? }
end
