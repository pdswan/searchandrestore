class AddWebsiteToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :website, :string
  end

  def self.down
    remove_column :artists, :website
  end
end
