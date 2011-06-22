class AddAddressLatitudeAndLongitudeToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :address, :string
    add_column :venues, :latitude, :decimal, :precision => 10, :scale => 8
    add_column :venues, :longitude, :decimal, :precision => 10, :scale => 8
  end

  def self.down
    remove_column :venues, :longitude
    remove_column :venues, :latitude
    remove_column :venues, :address
  end
end
