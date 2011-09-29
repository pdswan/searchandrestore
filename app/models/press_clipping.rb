class PressClipping < ActiveRecord::Base
  validates :source,
            :author,
            :presence => true
end
