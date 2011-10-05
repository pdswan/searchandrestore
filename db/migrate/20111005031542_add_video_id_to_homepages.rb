class AddVideoIdToHomepages < ActiveRecord::Migration
  def self.up
    add_column :homepages, :video_id, :integer
  end

  def self.down
    remove_column :homepages, :video_id
  end
end
