class Artist < ActiveRecord::Base
  mount_uploader :image, ArtistImageUploader

  validates_presence_of :name, :bio
end
