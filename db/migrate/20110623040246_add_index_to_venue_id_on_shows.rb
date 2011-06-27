class AddIndexToVenueIdOnShows < ActiveRecord::Migration
  def self.up
    add_index :shows, :venue_id
  end

  def self.down
    remove_index :shows, :venue_id
  end
end
