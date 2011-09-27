class AddFeaturedToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :shows, :featured
  end
end
