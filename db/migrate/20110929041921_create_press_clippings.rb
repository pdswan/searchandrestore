class CreatePressClippings < ActiveRecord::Migration
  def self.up
    create_table :press_clippings do |t|
      t.string :source
      t.string :author
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :press_clippings
  end
end
