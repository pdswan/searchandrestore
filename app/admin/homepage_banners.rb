ActiveAdmin.register HomepageBanner do
  form(:html => { :enctype => 'multipart/form-data' }) do |f|
    f.inputs do
      f.input :image, :as => :file, :hint => 'Image will be resized to a width of 630px'
      f.input :url, :hint => 'Optional url for the banner to link to'

      f.buttons
    end
  end
  
  show do
    attributes_table do
      row(:image) { image_tag(homepage_banner.image.url) if homepage_banner.image.present? }
      row(:url) { link_to(homepage_banner.url, homepage_banner.url, :target => '_blank') if homepage_banner.url.present? }
    end
  end
end
