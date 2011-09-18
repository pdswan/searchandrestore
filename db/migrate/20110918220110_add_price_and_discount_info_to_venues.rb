class AddPriceAndDiscountInfoToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :price_and_discount_info, :string
  end

  def self.down
    remove_column :venues, :price_and_discount_info
  end
end
