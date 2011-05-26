class AddImageToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :image, :string
  end

  def self.down
    remove_column :artists, :image
  end
end
