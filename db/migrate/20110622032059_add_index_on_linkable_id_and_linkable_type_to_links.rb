class AddIndexOnLinkableIdAndLinkableTypeToLinks < ActiveRecord::Migration
  def self.up
    add_index :links, [:linkable_id, :linkable_type, :type]
  end

  def self.down
    remove_index :links, :column => [:linkable_id, :linkable_type, :type]
  end
end
