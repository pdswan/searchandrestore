class Instrument < ActiveRecord::Base
  default_scope order("instruments.name ASC")

  validates :name, :presence => true, :uniqueness => true

  def name=(name)
    write_attribute(:name, name.try(:downcase))
  end
end
