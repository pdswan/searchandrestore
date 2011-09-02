class Artist < ActiveRecord::Base
  default_scope order('name ASC')

  mount_uploader :image, ArtistImageUploader

  belongs_to :instrument
  accepts_nested_attributes_for :instrument, :reject_if => proc { |attributes| attributes['name'].blank? }

  has_many :buy_links, :as => :linkable
  accepts_nested_attributes_for :buy_links, :reject_if => proc { |attributes| attributes['url'].blank? }

  has_many :performances, :dependent => :destroy
  has_many :shows, :through => :performances
  has_many :upcoming_shows, :through => :performances,
                            :source  => :show,
                            :conditions => ["#{Show.quoted_table_name}.when > ?", Time.zone.now]

  def videos
    Video.for_artist(self)
  end

  def associated_artists
    show_ids = shows.unscoped.select("shows.id").collect(&:id)

    self.class.
      with_state(:live).
      joins(:shows).
      where(["artists.id <> ?", id]).
      where(:shows => { :id => show_ids })
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
