class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.integer :show_id
      t.integer :artist_id
      t.integer :instrument_id

      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
