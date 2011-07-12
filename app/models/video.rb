class Video < ActiveRecord::Base
  attr_protected :embed_code, :thumbnail, :remote_thumbnail_url

  belongs_to :show

  has_many :performances, :through => :show

  mount_uploader :thumbnail, VideoThumbnailUploader

  def self.oembed_options
    { :width  => 651,
      :height => 350 }
  end

  def url=(url)
    ret = write_attribute(:url, url)

    if ret && url_changed?
      require 'oembed'

      if resource = OEmbed::Providers::Vimeo.get(oembed_request_url)
        self.title                = resource.title if self.title.blank?
        self.embed_code           = resource.html
        self.remote_thumbnail_url = resource.thumbnail_url
      end
    end

    ret
  end

  def oembed_request_url
    url + '?' + self.class.oembed_options.to_query if url.present?
  end
end
