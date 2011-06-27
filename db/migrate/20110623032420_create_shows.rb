class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.integer :venue_id
      t.string :group_name
      t.datetime :when
      t.string :cover_charge
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
