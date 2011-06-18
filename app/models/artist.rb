class Artist < ActiveRecord::Base
  mount_uploader :image, ArtistImageUploader

  belongs_to :instrument

  validates_presence_of :name, :bio
end
