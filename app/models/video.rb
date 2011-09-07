class Video < ActiveRecord::Base
  attr_protected :embed_code, :thumbnail, :remote_thumbnail_url

  belongs_to :show

  has_many :performances, :through => :show

  scope :order_by_show_date, joins(:show).order("shows.when DESC")
  scope :group_by_show, group("shows.id")

  def self.for_artist(artist)
    raise ArgumentError.new("artist must be a kind of Artist") unless artist.kind_of?(Artist)
    joins(:performances).
      where(:performances => { :artist_id => artist.id })
  end

  mount_uploader :thumbnail, VideoThumbnailUploader

  def self.oembed_options
    { :width    => 621,
      :height   => 350,
      :title    => 0,
      :byline   => 0,
      :portrait => 0,
      :color    => 'ffffff' }
  end

  def self.update_existing_embed_codes
    find_each do |video|
      video.fetch_oembed
      video.save
    end
  end

  def url=(url)
    ret = write_attribute(:url, url)
    
    fetch_oembed if ret && url_changed?

    ret
  end

  def url
    read_attribute(:url) ||
      (embed_code.present? ? embed_code.match(/src=['"]([^'"]+)/)[1] : nil)
  end

  def oembed_request_url
    url + '?' + self.class.oembed_options.to_query if url.present?
  end

  def fetch_oembed
    require 'oembed'

    if resource = OEmbed::Providers::Vimeo.get(oembed_request_url)
      self.title                = resource.title if self.title.blank?
      self.embed_code           = resource.html
      self.remote_thumbnail_url = resource.thumbnail_url
    end
  end
end
