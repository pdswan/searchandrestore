class AddImageToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :image, :string
  end

  def self.down
    remove_column :venues, :image
  end
end
