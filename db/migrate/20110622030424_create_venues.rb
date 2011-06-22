class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.boolean :music_every_night
      t.integer :capacity
      t.boolean :reservations
      t.string :age_restriction
      t.string :food_and_drink
      t.string :website
      t.text :their_words
      t.text :our_words

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
