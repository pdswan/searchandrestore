class CreateLinkGroups < ActiveRecord::Migration
  def self.up
    create_table :link_groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :link_groups
  end
end
