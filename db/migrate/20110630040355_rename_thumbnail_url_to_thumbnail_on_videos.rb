class RenameThumbnailUrlToThumbnailOnVideos < ActiveRecord::Migration
  def self.up
    rename_column :videos, :thumbnail_url, :thumbnail
  end

  def self.down
    rename_column :videos, :thumbnail, :thumbnail_url
  end
end
