class AddSearchAndRestoreToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :search_and_restore, :boolean, :default => false
  end

  def self.down
    remove_column :shows, :search_and_restore
  end
end
