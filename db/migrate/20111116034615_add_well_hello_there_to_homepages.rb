class AddWellHelloThereToHomepages < ActiveRecord::Migration
  def self.up
    add_column :homepages, :well_hello_there, :text
  end

  def self.down
    remove_column :homepages, :well_hello_there
  end
end
