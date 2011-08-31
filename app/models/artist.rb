class Artist < ActiveRecord::Base
  default_scope order('name ASC')

  mount_uploader :image, ArtistImageUploader

  belongs_to :instrument
  accepts_nested_attributes_for :instrument, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_many :buy_links, :as => :linkable
  accepts_nested_attributes_for :buy_links, :reject_if => proc { |attributes| attributes['url'].blank? }

  has_many :performances
  has_many :shows, :through => :performances

  def upcoming_shows
    shows.upcoming
  end

  validates_presence_of :name

  state_machine :state, :initial => :in_progress do
    state :live do
      validates_presence_of :bio
    end
  end

  def self.state_options
    state_machine.states.inject({ }) do |hash, state|
      hash.merge(state.name.to_s.titleize => state.name)
    end
  end
end
