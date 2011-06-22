class Artist < ActiveRecord::Base
  mount_uploader :image, ArtistImageUploader

  belongs_to :instrument
  accepts_nested_attributes_for :instrument, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_many :buy_links, :as => :linkable
  accepts_nested_attributes_for :buy_links, :reject_if => proc { |attributes| attributes['url'].blank? }

  validates_presence_of :name, :bio
end
