class Homepage < ActiveRecord::Base
  belongs_to :video

  has_many :blurbs, :as => :blurbable
  accepts_nested_attributes_for :blurbs, :reject_if => proc { |attrs| attrs['title'].blank? && attrs['text'].blank? }
end
