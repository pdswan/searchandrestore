module HomeHelper
  def display_banner(banner)
    return '' unless banner.present?

    if banner.url.present?
      link_to banner.url, :target => '_blank' do
        banner_image(banner)
      end
    else
      banner_image(banner)
    end
  end

  def banner_image(banner)
    image_tag(banner.image.url)
  end
end
