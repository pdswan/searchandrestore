class AddTitleToAbouts < ActiveRecord::Migration
  def self.up
    add_column :abouts, :title, :string
  end

  def self.down
    remove_column :abouts, :title
  end
end
