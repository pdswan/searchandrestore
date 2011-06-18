class AddIndexToInstrumentsName < ActiveRecord::Migration
  def self.up
    add_index :instruments, :name
  end

  def self.down
    remove_index :instruments, :name
  end
end
