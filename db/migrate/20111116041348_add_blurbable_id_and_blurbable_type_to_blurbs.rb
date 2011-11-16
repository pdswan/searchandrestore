class AddBlurbableIdAndBlurbableTypeToBlurbs < ActiveRecord::Migration
  def self.up
    add_column :blurbs, :blurbable_id, :integer
    add_column :blurbs, :blurbable_type, :text
  end

  def self.down
    remove_column :blurbs, :blurbable_type
    remove_column :blurbs, :blurbable_id
  end
end
