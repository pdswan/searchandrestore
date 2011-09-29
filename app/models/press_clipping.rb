class PressClipping < ActiveRecord::Base
  validates :source,
            :author,
            :date,
            :link,
            :presence => true

  has_one :link, :as => :linkable
  accepts_nested_attributes_for :link
end
