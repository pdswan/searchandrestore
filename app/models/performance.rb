class Performance < ActiveRecord::Base
  belongs_to :artist
  accepts_nested_attributes_for :artist,
                                :reject_if => proc { |attributes| attributes[:name].blank? }

  belongs_to :instrument
  accepts_nested_attributes_for :instrument,
                                :reject_if => proc { |attributes| attributes[:name].blank? }

  belongs_to :show
end
