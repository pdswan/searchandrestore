class Artist < ActiveRecord::Base
  mount_uploader :image, ArtistImageUploader
end
