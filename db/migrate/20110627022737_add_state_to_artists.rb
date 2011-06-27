class AddStateToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :state, :string
  end

  def self.down
    remove_column :artists, :state
  end
end
