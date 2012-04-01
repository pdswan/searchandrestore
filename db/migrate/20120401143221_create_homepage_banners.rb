class CreateHomepageBanners < ActiveRecord::Migration
  def self.up
    create_table :homepage_banners do |t|
      t.string :url
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :homepage_banners
  end
end
