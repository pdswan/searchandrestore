class AddVideoDescriptionToHomepages < ActiveRecord::Migration
  def self.up
    add_column :homepages, :video_description, :text
  end

  def self.down
    remove_column :homepages, :video_description
  end
end
