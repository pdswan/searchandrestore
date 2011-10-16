class LinkGroup < ActiveRecord::Base
  validates_presence_of :name

  has_many :links, :as => :linkable
  accepts_nested_attributes_for :links, :reject_if => proc { |attributes| attributes['url'].blank? }
end
