class AddInstrumentIdToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :instrument_id, :integer
    add_index :artists, :instrument_id
  end

  def self.down
    remove_index :artists, :instrument_id
    remove_column :artists, :instrument_id
  end
end
