class Artist < ActiveRecord::Base
  mount_uploader :image, ArtistImageUploader

  belongs_to :instrument
  accepts_nested_attributes_for :instrument, :reject_if => proc { |attributes| attributes['name'].blank? }

  validates_presence_of :name, :bio
end
