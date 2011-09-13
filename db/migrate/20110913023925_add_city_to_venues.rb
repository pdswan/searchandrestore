class AddCityToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :city, :string
  end

  def self.down
    remove_column :venues, :city
  end
end
