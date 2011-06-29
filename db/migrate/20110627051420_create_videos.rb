class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :url
      t.text :embed_code
      t.integer :show_id

      t.timestamps
    end

    add_index :videos, :show_id
  end

  def self.down
    remove_index :videos, :show_id
    drop_table :videos
  end
end
