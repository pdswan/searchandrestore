class Instrument < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  def name=(name)
    write_attribute(:name, name.try(:downcase))
  end
end
